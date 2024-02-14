# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Tag.destroy_all
PrivateMessage.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
10.times do 
  city = City.create!(name:Faker::Address.city, zip_code:Faker::Address.zip_code)
end

cities = City.all
10.times do 
  user = User.create!(first_name: Faker::GreekPhilosophers.name, last_name:Faker::Name.last_name, description:Faker::GreekPhilosophers.quote, email:Faker::Internet.email, age:Faker::Number.decimal_part(digits: 2), city:cities.sample)
end

users = User.all
20.times do
  gossip = Gossip.create!(title:Faker::Cannabis.strain[0, 14]  , content:Faker::Quote.yoda , user: users.sample)
end

10.times do
  tag = Tag.create!(title: "#{'#' + Faker::Verb.past}")
end

JoinTagWithGossip.destroy_all
tags = Tag.all
gossips = Gossip.all
100.times do
  jointagwithgossip = JoinTagWithGossip.create!(tag:tags.sample, gossip:gossips.sample)
end

#Private message
PrivateMessage.destroy_all
users = User.all
50.times do
  privatemessage = PrivateMessage.create!(content: Faker::Quotes::Shakespeare.as_you_like_it_quote, sender: users.sample, recipient: users.sample)
end

User.create(first_name:"anon", last_name:"nymous", description:"vie deriere un ecran", email: "anon@society.world", age:99, city_id:8)