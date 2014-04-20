class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @user = User.find session[:user_id]
    item = @user.items.build(item_params)

    set_default_values item
    
    item.save

    #@user.items.create(title: "t1", description: "d1", starting_price: '30', end_date: "2014-04-27 23:53:38 UTC")

    #logger.debug "create new item params #{item_params}"

    #logger.debug "after creating record #{@user.items.all}"
    
    redirect_to items_path
  end

  def show
    @item = Item.find params[:id]
    
    # @data = params[:data][:data1] || "no data"

  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy

    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :starting_price, :end_date)
  end

  def set_default_values item
    item[:title] = "title" if item[:title] == ''
    item[:starting_price] = "30" if item[:starting_price] == ''
    item[:start_date] = Time.noe.utc if item[:start_date] == ''
    item[:end_date] = "2014-04-27 23:53:38 UTC" if item[:end_date] == ''
    item
  end

  def permissions_to_delete? item
    session[:user_id] == item[:user_id]
  end

  helper_method :permissions_to_delete?

end
