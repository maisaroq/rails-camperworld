# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#puts "Deleting all prior users and listings"
User.destroy_all
Listing.destroy_all

user = User.create(email: 'camperworld@gmail.com', password: '123456')
# puts user.id

#listing = Listing.create(user: User.first, name: "tent", description: "a dark green tent was made in 1970 served campers from all over the world 7777777777", price: 20.00, location: "Berlin",equipment_type: "Tent", image: "https://source.unsplash.com/random")

#puts "---Creating 20 fake products..."
# 20.times do
#   listing = Listing.create!(
#     name: "name",
#     description: "description88888888888888888888888888888888888888888888888888jhdcjhuchehduehuehueiejihihigugugugfuyfyfyuihihih shjh",
#     price: 20.00,
#     equipment_type: ["Tent", "Campervan", "Cooker", "Survival Kit", "Backpack"].sample,
#     listing_photo: "https://source.unsplash.com/random",
#     user_id: user.id,
#     location: "Berlin"
#   )
#   puts listing.name
# end
# puts "---Done creating products!"

# Creating us as users for demo purposes
puts "---Creating Users..."
hannah = User.create(email: 'hannah@gmail.com', password: '123456')
mais = User.create(email: 'mais@gmail.com', password: '123456')
emily = User.create(email: 'emily@gmail.com', password: '123456')
vojtech = User.create(email: 'vojtech@gmail.com', password: '123456')
puts "---Done creating users!"

# Creating associated Listings for demo purposes
puts "---Creating fake products..."

Listing.create!(
  name: "Galaxy",
  description: "There is no greater freedom than the freedom to be yourself.",
  price: 150.00,
  equipment_type: "Campervan",
  listing_photo: "https://i.pinimg.com/originals/24/69/ed/2469ed472696f2b0f81c60e628704116.jpg",
  user_id: vojtech.id,
  location: "Berlin"
)

Listing.create!(
  name: "Fancy Yurt",
  description: "Warm tea, good books & cozy sheets.",
  price: 90.00,
  equipment_type: "Tent",
  listing_photo: "https://i.pinimg.com/originals/b7/fb/d1/b7fbd18b6bc588aa56106579ec8c1369.jpg",
  user_id: hannah.id,
  location: "Barcelona"
)

Listing.create!(
  name: "Cozy Campervan",
  description: "Warm tea, good books & cozy sheets.",
  price: 145.00,
  equipment_type: "Campervan",
  listing_photo: "https://i.pinimg.com/736x/f8/4e/aa/f84eaace2c7b88f0c4877b94b589de12.jpg",
  user_id: hannah.id,
  location: "Barcelona"
)

Listing.create!(
  name: "Full hiking gear",
  description: "Leave Nothing But Footprints. Take Nothing But Pictures. Kill Nothing But Time.",
  price: 185.00,
  equipment_type: "Gear",
  listing_photo: "https://i.pinimg.com/originals/0e/ff/ca/0effca720a7ed29fb2dbc0ba9ff3dc9c.jpg",
  user_id: mais.id,
  location: "Brussels"
)

Listing.create!(
  name: "Dolphin Cruiser",
  description: "Money can't buy happiness, but it can buy a camper, which is kind of the same thing.",
  price: 125.00,
  equipment_type: "Campervan",
  listing_photo: "https://25purb1qs9y91rvlxr44yeeg-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/MG_2543-2-scaled.jpg",
  user_id: emily.id,
  location: "Amsterdam"
)

Listing.create!(
  name: "Handy fire cooker",
  description: "'How is it that one match can start a forest fire, but it takes a whole box of matches to start a campfire?' – Christy Whitehead",
  price: 65.00,
  equipment_type: "Cooker",
  listing_photo: "https://i.pinimg.com/originals/e7/d6/df/e7d6dff069ea76f17af7f7bc74bd4e34.jpg",
  user_id: mais.id,
  location: "Brussels"
)

Listing.create!(
  name: "Large Backpack",
  description: "'And Into The Forest I Go, To Lose My Mind And Find My Soul.",
  price: 15.00,
  equipment_type: "Backpack",
  listing_photo: "https://i.pinimg.com/originals/83/91/59/8391593941a695b9ff75d83358ea6c92.jpg",
  user_id: mais.id,
  location: "Brussels"
)

Listing.create!(
  name: "Home on four wheels",
  description: "There is no greater freedom than the freedom to be yourself.",
  price: 80.00,
  equipment_type: "Campervan",
  listing_photo: "https://i.pinimg.com/564x/5e/d9/c0/5ed9c0f8386a54be73bd0017f0b71d80.jpg",
  user_id: emily.id,
  location: "Amsterdam"
)

Listing.create!(
  name: "Galaxy themed tent",
  description: "The farther one gets into the wilderness, the greater is the attraction of its lonely freedom.",
  price: 40.00,
  equipment_type: "Tent",
  listing_photo: "https://images-na.ssl-images-amazon.com/images/I/5187cTTS1PL._AC_SY350_.jpg",
  user_id: vojtech.id,
  location: "Berlin"
)

puts "---Done creating products!"


