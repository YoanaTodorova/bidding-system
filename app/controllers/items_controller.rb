class ItemsController < ApplicationController
  # before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all
  end

  def refresh
    render :partial => 'items/items_list', :format => 'text/html', :locals => { :items => Item.all }
  end

  def refresh_item_bids
    @active_auctions = @item.auctions.where(:status => "active")

    @current_highest_prices = {}

    @active_auctions.each do |auction|
      @current_highest_prices[auction[:id]] =  auction.bids.maximum(:price) || @item[:starting_price]
    end

    render :partial => 'items/bids_list', :format => 'text/html', :locals => { :active_auctions => @active_auctions, :current_highest_prices => @current_highest_prices }
  end

  def create
    @user = User.find session[:user_id]
    item = @user.items.build(item_params)

    set_default_values(item).save

    item.auctions.create(:status => "active")

    redirect_to :controller => "items", :action => "index"
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

    redirect_to :controller => "items", :action => "index"
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

  def set_item
    @item = Item.find params[:id]
  end

  helper_method :permissions_to_delete?
  helper_method :can_view_auctions?

end
