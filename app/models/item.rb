class Item < ActiveRecord::Base
  attr_protected :admin

  belongs_to :user
  has_many :auctions
end
