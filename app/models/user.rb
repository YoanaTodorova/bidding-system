class User < ActiveRecord::Base
  attr_protected :admin
  
  has_secure_password

  has_many :items
  has_many :auctions, :class_name => 'Auction', :foreign_key => 'winning_user_id'
  has_many :bids

end
