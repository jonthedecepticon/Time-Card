# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.create(email: "test@test.com", password:"password", password_confirmation: "password", first_name: "Kent", last_name: "Clark")

puts "1 user created"

100.times do |post|
  Post.create(date: Date.today, rational: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
