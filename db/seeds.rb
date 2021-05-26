# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


puts "Deleting all prior users and listings"
User.destroy_all
Listing.destroy_all

puts "--Creating 15 fake users"
15.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  print "#{user.id} "
end
puts ""
puts "---Done creating users!"
puts ""
puts "---Creating 20 fake products..."
20.times do
  listing = Listing.new(
    location: ["Berlin", "Prague", "paris"].sample,
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    equipment_type: ["Tent", "Campervan", "Cooker", "Survival Kit", "Backpack"].sample,
    image: "https://source.unsplash.com/random",
    user_id: rand(16..25)
  )
  puts listing.name
  listing.save!
end
puts "---Done creating products!"
