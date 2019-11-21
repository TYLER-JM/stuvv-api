# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'

5.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password", email: Faker::Internet.email)
end

10.times do
  Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: rand(1..5), price_per_day: rand(100..10000) )
end

Request.create!(listing_id: 1, user_id: 2, start_date: Time.new(2019, 11, 25), end_date: Time.new(2019, 11, 30))
Request.create!(listing_id: 2, user_id: 3, start_date: Time.new(2019, 11, 26), end_date: Time.new(2019, 11, 27))
Request.create!(listing_id: 3, user_id: 4, start_date: Time.new(2019, 12, 5), end_date: Time.new(2019, 12, 10))
Request.create!(listing_id: 1, user_id: 4, start_date: Time.new(2019, 12, 5), end_date: Time.new(2019, 12, 10))
Request.create!(listing_id: 2, user_id: 1, start_date: Time.new(2019, 12, 6), end_date: Time.new(2019, 12, 11))


conversation1 = [
  {"1": "hi I want to rent your bike", "sent": Time.now()},
  {"2": "no thanks, its not back", "sent": Time.now()},
  {"1": "I will check back later", "sent": Time.now()},
  {"2": "please do, bye now", "sent": Time.now()}
]
@user1 = User.find(1)
@user2 = User.find(2)

Message.create!(conversation: conversation1.to_json, from_user_id: 2, to_user_id: 1)