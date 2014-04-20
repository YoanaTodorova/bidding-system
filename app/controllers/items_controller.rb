class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def refresh
    render :partial => 'items/items_list', :format => 'text/html', :locals => { :items => Item.all }
  end

  def create
    @user = User.find session[:user_id]
    item = @user.items.build(item_params)

    set_default_values item

    item.save

    #@user.items.create(title: "t1", description: "d1", starting_price: '30', end_date: "2014-04-27 23:53:38 UTC")

    #logger.debug "create new item params #{item_params}"

    #logger.debug "after creating record #{@user.items.all}"
    
    item.auctions.create(:status => "active")

    redirect_to items_path
  end

  def show
    @item = Item.find params[:id]

    @active_auctions = @item.auctions.where(:status => "active")

    @current_highest_prices = {}

    @active_auctions.each do |auction|
      @current_highest_prices[auction[:id]] =  auction.bids.maximum(:price) || @item[:starting_price]
    end
    
    # @data = params[:data][:data1] || "no data"

  end

  def destroy
    @item = Item.find params[:id]
    if session[:user_id] && session[:user_id] == @item[:user_id] then
      @item.destroy
    end

    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :starting_price, :end_date)
  end

  def set_default_values item
    item[:title] = "title" if item[:title] == ''
    item[:starting_price] = "30" if item[:starting_price] == '' or item[:starting_price] == nil
    item[:start_date] = Time.now.utc if item[:start_date] == '' or item[:start_date] == nil
    item[:end_date] = "2014-04-27 23:53:38 UTC" if item[:end_date] == '' or item[:end_date] == nil
    item
  end

  def permissions_to_delete? item
    session[:user_id] == item[:user_id]
  end

  def can_view_auctions?
    session[:user_id]
  end

  helper_method :permissions_to_delete?
  helper_method :can_view_auctions?

end
