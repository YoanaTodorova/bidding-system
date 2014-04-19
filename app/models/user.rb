class User < ActiveRecord::Base
  attr_protected :admin
  
  has_secure_password

  has_many :items

end
