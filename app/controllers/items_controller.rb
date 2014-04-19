class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @user = User.find session[:user_id]
    params = item_params
    @user.items.create
    # (title: params[:title],
    #   description: params[:description],
    #   starting_price: params[:starting_price],
    #   end_date: params[:end_date])

    logger.debug "user object in create action of item controller #{ @user.inspect }"

    redirect_to items_path, :notice => @user.inspect
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :starting_price, :end_date)
  end

end
