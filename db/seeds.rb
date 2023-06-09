# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

VILLE = %w[Port-Louis	Beau-Bassin Rose-Hill	Vacoas-Phœnix	Curepipe Quatre-Bornes Trou-aux-Biches
Goodlands Centre-de-Flacq Bel-Air Mahébourg	Saint-Pierre	Le-Hochet	Baie-du-Tombeau	Bambous	Rose-Belle
Chemin-Grenier	Rivière-du-Rempart	Grand-Baie	Plaine-Magnien	Pailles	Surinam	Lalmatie	New-Grove
Rivière-des-Anguilles	Terre-Rouge	Petit-Raffray	Moka Pamplemousses Montagne-Blanche	L'Escalier]

Vehicule.destroy_all
puts "deleted all Vehicule"
Review.destroy_all
puts "deleted all Review"
Booking.destroy_all
puts "deleted all booking"
Ride.destroy_all
puts "deleted all rides"
User.destroy_all
puts "deleted all user"

User.create(
  email:'test@gmail.com',
  password: "password",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  age: rand(18..60),
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5),
  account_status: "user",
  location: "Port-Louis"
)

puts "creation d'un passenger"
passenger_seed = User.create(
  email: Faker::Internet.email,
  password: "FF1234",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  age: rand(18..60),
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5),
  account_status: "user"
)
passenger_seed.save

puts "creation de plusieurs drivers"
3.times do
  driver_seed = User.create(
    email: Faker::Internet.email,
    password: "FF1234",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..60),
    location: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    payment_details: Faker::Finance.credit_card,
    rating: rand(0..5),
    account_status: "driver"
  )
  driver_seed.save

  puts "creation d'une voiture pour le driver"
  vehicule_seed = Vehicule.create(
    model: Faker::Vehicle.make_and_model,
    registration_detail: Faker::Vehicle.standard_specs,
    user_id: driver_seed.id
  )

  puts "creation de 1 à 3 rides par driver"
  rand(1..3).times do
    ville_start = VILLE.sample
    ville_end = VILLE.excluding(ville_start).sample
    # ville_end = VILLE.sample,
    ride_seed = Ride.create(
      start_location: ville_start,
      end_location: ville_end,
      ride_details: Faker::Vehicle.standard_specs,
      distance: rand(1..61),
      start_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1, format: :short),
      end_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 2, format: :short),
      price: rand(100..1000),
      seats: rand(1..4),
      vehicule_id: vehicule_seed.id
    )

    puts "creation d'un booking par ride"
    Booking.create(
      ride_id: ride_seed.id,
      user_id: driver_seed.id
    )

    puts "creation d'1 à 4 review par ride"
    # les reviews sont créees par un seul user(passenger pour l'instant)
    rand(0..4).times do
      Review.create(
        rating: rand(0..5),
        comment: Faker::Quote.matz,
        timestamp: Time.now,
        user_id: passenger_seed.id,
        ride_id: ride_seed.id
      )
    end
  end
end
