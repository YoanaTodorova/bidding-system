class Bid < ActiveRecord::Base
  attr_protected :admin
  
  belongs_to :auction
  belongs_to :user
end
