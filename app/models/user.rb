class User < ActiveRecord::Base
  has_many :items
  has_many :authored_comments, :foreign_key => "author_id", :class_name => "Comment"
  has_many :received_comments, :foreign_key => "receiver_id", :class_name => "Comment"
end
