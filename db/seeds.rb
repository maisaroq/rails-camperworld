# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

equipments = ["Tent", "Campervan", "Cooker", "Survival Kit", "Backpack"]

30.times do
  Listing.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    equipment_type: equipments.sample,
    image: "https://source.unsplash.com/random"
  )
end
