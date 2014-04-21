class BidsController < ApplicationController
  def create
    auction = Auction.find params[:bid][:auction_id]

    auction.bids.create(:user_id => session[:user_id],
                        :auction_id => auction[:id],
                        :set_time => Time.now.utc,
                        :price => params[:bid][:price])

    # logger.debug "auction_id is #{params.inspect}"
    redirect_to :controller => "items", :action => "show", :id => auction[:item_id]
  end
end
