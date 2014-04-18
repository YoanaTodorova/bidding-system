# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users_list = [
  ["Name1", "name1@gmail.com"],
  ["Name2", "name2@gmail.com"],
  ["Name3", "name3@gmail.com"]
]

users_list.each do |name, email|
  User.create(name: name, email: email)
end

#user1 = User.new({:name => "Name4", :email => "name4@gmail.com"}, without_protection: true)
#comment = Comment.create(:content => "text text text", :author => User.find(:first, :conditions => ["name = ?", "Name4"]))
#user2 = User.create(:name => "Name5", :email => "name5@gmail.com")
