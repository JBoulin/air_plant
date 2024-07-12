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

grace_burgess = User.create!(
  email: "grace@test.com",
  password: "password12",
  username: "graceburgess"
)

file_cactus1 = URI.open("https://www.artplants.fr/media/catalog/product/cache/b940d19a38559eb8d9b0e195e9107a20/2/5/25023-nr-1.jpg")
cactus1 = Plant.new(
  name: "Cactus Echeveria NADIA",
  description: "Le echeveria NADIA de couleur vert-rouge constituera une décoration élégante dans de nombreux styles de maison.",
  price: 25,
  user: grace_burgess
)
cactus1.photo.attach(io: file_cactus1, filename: "CactusEcheveriaNADIA.jpg", content_type: "image/jpg")
cactus1.save!


lizzie_shelby = User.create!(
  email: "lizzie2@test.com",
  password: "password21",
  username: "lizzieshelby"
)

file_cactus2 = URI.open("https://images.truffaut.com/media/catalog/product/3/b/3bc1ca2e02991108.jpg?width=700&height=700&store=fr&image-type=image")
cactus2 = Plant.create!(
  name: "Cactus Echeveria agavoides",
  description: "Pour illuminer votre espace extérieur, optez pour l'Echeveria agavoide. Cette plante succulente ajoutera une touche décorative à votre jardin ou terrasse. Facile à entretenir, elle s'adresse à tous, des jardiniers novices aux experts.",
  price: 25,
  user: lizzie_shelby
)
cactus2.photo.attach(io: file_cactus2, filename: "CactusEcheveriaagavoides.jpg", content_type: "image/jpg")

tom_hardy = User.create!(
  email: "tom@test.com",
  password: "password34",
  username: "tom_hardy"
)

file_sapin2 = URI.open("https://www.sapins-noel.fr/452-thickbox_01oslo/sapin-epicea-naturel.jpg")
sapin2 = Plant.new(
  name: "Sapin de Noël épicéa",
  description: "L'épicéa est un sapin traditionnel de Noël, apprécié pour son aspect rustique et son parfum boisé. Il est souvent utilisé comme sapin de Noël naturel pour sa beauté et sa forme régulière.",
  price: 40,
  user: tom_hardy
)
sapin2.photo.attach(io: file_sapin2, filename: "SapinEpicéa.jpg", content_type: "image/jpg")
sapin2.save!

joe_cole = User.create!(
  email: "joe@test.com",
  password: "password35",
  username: "joe_cole"
)

file_sapin2 = URI.open("https://www.sapins-noel.fr/430-thickbox_01oslo/sapin-nordmann-naturel.jpg")
sapin2 = Plant.new(
  name: "Sapin de Noël naturel Abies nordmann",
  description: "C'est le plus apprécié comme 'sapin de Noël' grâce à la bonne tenue de ses aiguilles en intérieur. Son port pyramidal et son beau feuillage vert sombre et luisant dessus, argenté dessous feront de ce sapin le roi de la fête. Il distillera son parfum puissant évoquant l'orange dans toute la maison.",
  price: 45,
  user: joe_cole
)
sapin2.photo.attach(io: file_sapin2, filename: "SapinAbiesNordmann.jpg", content_type: "image/jpg")
sapin2.save!

file_bamboo = URI.open("https://images.ctfassets.net/b85ozb2q358o/fcb35e96589acc5e56db9d9ff2956fd3ad0004d55adb9df7b56ab7f2d996c8c9/ffa8e2f2a92105f7cee21f51a4aed18b/image.png")
bamboo = Plant.new(
  name: "Bamboo en pot",
  description: "Super bamboo large comme une foret, parfait pour créer de l'intimité",
  price: 70,
  user: joe_cole
)
bamboo.photo.attach(io: file_bamboo, filename: "bamboo.jpg", content_type: "image/jpg")
bamboo.save!

puts "Seed data created successfully!"
