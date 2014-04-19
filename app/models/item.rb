class Item < ActiveRecord::Base
  attr_protected :admin
  
  belongs_to :user
end
