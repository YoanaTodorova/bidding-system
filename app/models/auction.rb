class Auction < ActiveRecord::Base
  belongs_to :item
  belongs_to :winning_user, :class_name => 'User', :foreign_key => 'winning_user_id'
end
