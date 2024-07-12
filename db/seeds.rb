require "open-uri"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Booking.destroy_all
Plant.destroy_all
User.destroy_all

john_doe = User.create!(
  email: "john@test.com",
  password: "123456",
  username: "johndoe"
)

file = URI.open("https://images.ctfassets.net/b85ozb2q358o/3YnA2pLFdMDnr3rx4KdCtQ/a1bf618906fba92504876d609cd043ab/comment-entretenir-les-cactus-et-plantes-grasses-5.jpg")
cactus = Plant.new(
  name: "Cactus",
  description: "Une plante idéale à l'intérieur qui n'a pas besoin de beaucoup de soleil, ni d'eau. Elle se plaiera à merveille dans votre décoration et sera magnifique accompagnée de diverses espèces de plantes !",
  price: '20',
  user: john_doe
)
cactus.photo.attach(io: file, filename: "cactus.jpg", content_type: "image/jpg")
cactus.save!
