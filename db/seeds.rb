# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require 'faker'
require 'json'

#5.times do
  User.create!(first_name: "Truman", last_name: "Homenick", password: "password", email: "lair.heathcote@connharvey.com")
  User.create!(first_name: "Doug", last_name: "Lubowitz", password: "password", email: "trey.anderson@tremblay.name")
  User.create!(first_name: "Everette", last_name: "Schoen", password: "password", email: "christopher_hilll@nolan.info")
  User.create!(first_name: "Dwight", last_name:"Bahringer", password: "password", email: "dorene@spencer.biz")
  User.create!(first_name: "Rogelio", last_name: "Morissette", password: "password", email: "aliza@stamm.name")
  #User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password", email: Faker::Internet.email)
#end


Listing.create(title: "Awesome Grandma", description: "My Grandma is really nice and she tells good stories and she has a lot of free time. Comes with a sweet tooth, DON'T LET HER!" , user_id: 1, price_per_day: 100 )
Listing.create(title: "5 speed bike", description: "Lightly used, good for the city or the track" , user_id: 1, price_per_day: 500 )
Listing.create(title: "21 speed bike", description: "Almost brand new, I hardly use it", user_id: 2, price_per_day: 700 )
Listing.create(title: "Sportek kid's bike", description: "My son grew out of this. I think it still works fine", user_id: 2, price_per_day: 400 )
Listing.create(title: "Loving Grandma", description: "She bites!(Sometimes) She loves to bake and to knit", user_id: 2, price_per_day: 2000 )
Listing.create(title: "Polaroid Camera", description: "Vintage polaroid camera. I took with me to Africa and the pic are awesome. (Sheets not included)", user_id: 3, price_per_day: 500 )
Listing.create(title: "3-person Tent", description: "Squeeze 5 people in if you know each other well", user_id: 3, price_per_day: 600 )
Listing.create(title: "Waterproof Tent", description: "Last time we used it, there was just a little bit of water inside. Other than that it works great, the fly tarp is very secure", user_id: 4, price_per_day: 800 )
Listing.create(title: "Riding Lawnmower", description: "Price does not include gas but fill up before returning", user_id: 4, price_per_day: 1500 )
Listing.create(title: "20L Bucket", description: "Good for garbage or feeding animals", user_id: 4, price_per_day: 200 )
Listing.create(title: "Slop Bucket", description: "Comes with the slop", user_id: 5, price_per_day: 100 )
Listing.create(title: "Adult pair of Skis", description: "Good for powder or groomed runs. Good balance, for a 5.5 to 6 feet tall ", user_id: 5, price_per_day: 5000 )
Listing.create(title: "Camping Tent", description: "We used it once and we don't really like to camp, so it's almost brand new", user_id: 5, price_per_day: 500 )
Listing.create(title: "High-heel Sandal", description: "Size 7, red, good for a night out, weddings and bat mitzvahs", user_id: 5, price_per_day: 2000 )
Listing.create(title: "Comfy Chair", description: "You can lose many things on it but you might also find some coins", user_id: 5, price_per_day: 4000 )