class Auction < ActiveRecord::Base
  attr_protected :admin

  belongs_to :item
  belongs_to :winning_user, :class_name => 'User', :foreign_key => 'winning_user_id'
  has_many :bids
end
