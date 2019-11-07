# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Beast.delete_all
Sucker.delete_all
Type.delete_all


sucker = Sucker.create!(name: "Quarantaine", user_name: "loser", email: "loseremail@loser.loser", phone: "+123", encrypted_password: "pregnfnsat", password: "pregnfnsat", avatar: "beanface.png")

sucker = Sucker.create!(name: "Olivia", user_name: "liv", email: "coolemail@cool.cool", phone: "pls don't", encrypted_password: "password", password: "password", avatar: "cuteface.png")

sucker = Sucker.create!(name: "Nicola", user_name: "nicolas", email: "niconicos@email.com", phone: "444719", encrypted_password: "uggggggh", password: "uggggggh", avatar: "beardface.png")

sucker = Sucker.create!(name: "Na-oh-zky", user_name: "nautsky", email: "cjhvdjhbvd@jhchjvd.j", phone: "911", encrypted_password: "imfabulous69", password: "imfabulous69", avatar: "hatface.png")

poke = Type.new(name: "pokemon")
poke.save

10.times do
  owner = Sucker.all.sample
  region = Faker::Address.city
  description = Faker::Lorem.paragraph
  name = Faker::Games::Pokemon.name
  beast = Beast.new(name: name, region: region, description: description, sucker_id: owner.id, type_id: poke.id)
  beast.save
  beast.errors
end

sonic = Type.new(name: "sonic")
sonic.save

10.times do
  owner = Sucker.all.sample
  region = Faker::Address.city
  description = Faker::Lorem.paragraph
  name = Faker::Games::SonicTheHedgehog.character
  beast = Beast.new(name: name, region: region, description: description, sucker_id: owner.id, type_id: sonic.id)
  beast.save
end

zelda = Type.new(name: "zelda")
zelda.save

10.times do
  owner = Sucker.all.sample
  region = Faker::Address.city
  description = Faker::Lorem.paragraph
  name = Faker::Games::Zelda.character
  beast = Beast.new(name: name, region: region, description: description, sucker_id: owner.id, type_id: zelda.id)
  beast.save
end
