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

# 10.times do
# Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: rand(1..5), price_per_day: rand(100..10000) )
# end
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 1, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 1, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 2, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 2, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 2, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 3, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 3, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 4, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 4, price_per_day: rand(100..10000) )
Listing.create(title: Faker::Games::Dota.hero, description: Faker::Quote.most_interesting_man_in_the_world, user_id: 4, price_per_day: rand(100..10000) )


10.times do
  Image.create(url: Faker::LoremPixel.image(size: "300x300", is_gray: false, category: 'technics'), listing_id: rand(1..10) )
end

@user1 = User.find(1)
@user2 = User.find(2)
@user3 = User.find(3)
@user4 = User.find(4)
@user5 = User.find(5)

conversation1 = [
  {"sender": @user2.first_name, "content": "hi I want to rent your bike", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "no thanks, its not back", "sent": Time.now()},
  {"sender": @user2.first_name, "content": "I will check back later", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "please do, bye now", "sent": Time.now()}
]
conversation2 = [
  {"sender": @user3.first_name, "content": "im interested in your bbq", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "its available", "sent": Time.now()},
  {"sender": @user3.first_name, "content": "thats great, thanks", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "take good care of her", "sent": Time.now()}
]
conversation3 = [
  {"sender": @user4.first_name, "content": "is it available to rent", "sent": Time.now()},
  {"sender": @user2.first_name, "content": "its available", "sent": Time.now()},
  {"sender": @user4.first_name, "content": "thats great, thanks", "sent": Time.now()},
  {"sender": @user2.first_name, "content": "take good care the thing you rent", "sent": Time.now()}
]
conversation4 = [
  {"sender": @user4.first_name, "content": "can I rent please", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "its available", "sent": Time.now()},
  {"sender": @user4.first_name, "content": "I don't want it", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "why not", "sent": Time.now()}
]
conversation5 = [
  {"sender": @user5.first_name, "content": "I think it doesn't look good", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "it works fine", "sent": Time.now()},
  {"sender": @user5.first_name, "content": "I'm not interesting", "sent": Time.now()},
  {"sender": @user1.first_name, "content": "fine bye", "sent": Time.now()}
]

Message.create!(conversation: conversation1.to_json, from_user_id: 2, to_user_id: 1)
Message.create!(conversation: conversation2.to_json, from_user_id: 3, to_user_id: 1)
Message.create!(conversation: conversation3.to_json, from_user_id: 4, to_user_id: 2)
Message.create!(conversation: conversation4.to_json, from_user_id: 4, to_user_id: 1)
Message.create!(conversation: conversation5.to_json, from_user_id: 5, to_user_id: 1)

Request.create!(listing_id: 1, user_id: 2, message_id: 1, start_date: Time.new(2019, 11, 25), end_date: Time.new(2019, 11, 30))
Request.create!(listing_id: 2, user_id: 3, message_id: 2, start_date: Time.new(2019, 11, 26), end_date: Time.new(2019, 11, 27))
Request.create!(listing_id: 3, user_id: 4, message_id: 3, start_date: Time.new(2019, 12, 5), end_date: Time.new(2019, 12, 10))
Request.create!(listing_id: 1, user_id: 4, message_id: 4, start_date: Time.new(2019, 12, 5), end_date: Time.new(2019, 12, 10))
Request.create!(listing_id: 2, user_id: 5, message_id: 5, start_date: Time.new(2019, 12, 6), end_date: Time.new(2019, 12, 11))

Message.create!(conversation: conversation1.to_json, from_user_id: 1, to_user_id: 2)
Message.create!(conversation: conversation2.to_json, from_user_id: 1, to_user_id: 3)
Message.create!(conversation: conversation3.to_json, from_user_id: 2, to_user_id: 4)
Message.create!(conversation: conversation4.to_json, from_user_id: 1, to_user_id: 4)
Message.create!(conversation: conversation5.to_json, from_user_id: 1, to_user_id: 5)