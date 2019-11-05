# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = Sucker.new(name: "Quarantaine", user_name: "loser", email: "loseremail@loser.loser", phone: "+123", encrypted_password: "pregnfnsat", avatar: "beanface.png")
user.save

user = Sucker.new(name: "Olivia", user_name: "liv", email: "coolemail@cool.cool", phone: "pls don't", encrypted_password: "password", avatar: "cuteface.png")
user.save

user = Sucker.new(name: "Nicola", user_name: "nicolas", email: "niconicos@email.com", phone: "444719", encrypted_password: "uggggggh", avatar: "beardface.png")
user.save

user = Sucker.new(name: "Na-oh-zky", user_name: "nautsky", email: "cjhvdjhbvd@jhchjvd.j", phone: "911", encrypted_password: "imfabulous69", avatar: "hatface.png")
user.save

poke = Type.new(name: "pokemon")
poke.save

# 10.times do
#   owner = Sucker.all.sample
#   region = Faker::Games::Pokemon.location
#   description = Faker::Games::Pokemon.move
#   name = Faker::Games::Pokemon.name
#   beast = Beast.new(name: name, region: region, description: description, sucker_id: owner.id, type_id: poke.id)
#   beast.save
# end

# sonic = Type.new(name: "sonic")
# sonic.save

# 10.times do
#   owner = Sucker.all.sample
#   region = Faker::Games::SonicTheHedgehog.zone
#   description = Faker::Games::SonicTheHedgehog.game
#   name = Faker::Games::SonicTheHedgehog.character
#   beast = Beast.new(name: name, region: region, description: description, sucker_id: owner.id, type_id: sonic.id)
#   beast.save
# end

# zelda = Type.new(name: "zelda")
# zelda.save

# 10.times do
#   owner = Sucker.all.sample
#   region = Faker::Games::Zelda.location
#   description = Faker::Games::Zelda.game
#   name = Faker::Games::Zelda.character
#   beast = Beast.new(name: name, region: region, description: description, sucker_id: owner.id, type_id: zelda.id)
#   beast.save
# end
