# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#puts "Deleting all prior users and listings"
User.destroy_all
Listing.destroy_all

user = User.create(email: 'camperworld@gmail.com', password: '123456')
#listing = Listing.create(user: User.first, name: "tent", description: "a dark green tent was made in 1970 served campers from all over the world 7777777777", price: 20.00, location: "Berlin",equipment_type: "Tent", image: "https://source.unsplash.com/random")
puts user.id
#puts "--Creating 15 fake users"
#15.times do
#  user = User.new(
#    email: Faker::Internet.email,
#    password: Faker::Internet.password
#  )
#  user.save!
#  print "#{user.id} "
#end
#puts ""
#puts "---Done creating users!"
#puts ""
#puts "---Creating 20 fake products..."
20.times do
  Listing.create(
    name: "name",
    description: "description",
    price: 20.00,
    equipment_type: ["Tent", "Campervan", "Cooker", "Survival Kit", "Backpack"].sample,
#    image: "https://source.unsplash.com/random",
    user_id: user.id,
    location: "Berlin"
  )
end
puts user.id
puts Listing.all
puts "---Done creating products!"

