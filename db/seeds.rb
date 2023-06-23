require 'faker'
require 'open-uri'
VILLE = [
  { name: 'Port-Louis', latitude: -20.1606, longitude: 57.4989 },
  { name: 'Grand Baie', latitude: -20.0063, longitude: 57.5816 },
  { name: 'Flic-en-Flac', latitude: -20.2807, longitude: 57.3605 },
  { name: 'Le Morne Brabant', latitude: -20.4386, longitude: 57.3219 },
  { name: 'Trou aux Biches', latitude: -20.0378, longitude: 57.5477 },
  { name: 'Belle Mare', latitude: -20.1890, longitude: 57.7623 },
  { name: 'Black River Gorges National Park', latitude: -20.4305, longitude: 57.4046 },
  { name: 'Chamarel', latitude: -20.4281, longitude: 57.3742 },
  { name: 'Tamarin', latitude: -20.3191, longitude: 57.3706 },
  { name: 'Mahebourg', latitude: -20.4087, longitude: 57.7002 }
]

puts "Deleting existing data..."
Participant.delete_all
Message.delete_all
Chatroom.delete_all
Review.delete_all
Booking.delete_all
StartLocation.delete_all
EndLocation.destroy_all
Ride.delete_all
Vehicule.delete_all
User.delete_all

puts "Creating lea"
lea = User.create(
  email: 'lea@gmail.com',
  password: 'password',
  first_name: "Léa",
  last_name: "DRAGON",
  age: 27,
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5)
)
file = URI.open("https://avatars.githubusercontent.com/u/130605590?v=4")
lea.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
lea.save
puts "created lea photo"
#----------------------------#
puts "Creating milou"
milou = User.create(
  email: 'milou@gmail.com',
  password: 'password',
  first_name: "Milou",
  last_name: "DRAGON",
  age: 25,
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5)
)
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/3a495b99baba5026fd41c9c1cd342a2e_gvznas.jpg")
milou.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
milou.save
puts "created milou photo"
#----------------------------#
juanita = User.create(
  email: 'juanita@gmail.com',
  password: 'password',
  first_name: "Juanita",
  last_name: "SOLIS",
  age: 26,
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5)
)
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/d8d6410ae0c317178e1318f4ca97ea21_yw9spx.jpg")
juanita.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
juanita.save
puts "created juanita photo"
#----------------------------#
george = User.create(
  email: 'george@gmail.com',
  password: 'password',
  first_name: "george",
  last_name: "ANDROS",
  age: 40,
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5)
)
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/b565e1c9446b16de368ba4c0a2285b4e_vgq3ih.jpg")
george.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
george.save
puts "created george photo"

#----------------------------#
elodie = User.create(
  email: 'elodie@gmail.com',
  password: 'password',
  first_name: "Elodie",
  last_name: "FAYA",
  age: 19,
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5)
)
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/12db5a981fb89864eee3cc19445493dc_lb9d8v.jpg")
elodie.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
elodie.save
puts "created elodie photo"

puts "Creating a vehicle for elodie..."
vehicule_elodie_seed = Vehicule.create(
  model: "Audi A5",
  registration_detail: Faker::Vehicle.license_plate,
  user_id: elodie.id
)
puts "Created a vehicle for elodie."

puts "Creating 1 ride for elodie..."
ville_start = { name: 'Trou aux Biches', latitude: -20.0378, longitude: 57.5477 }
ville_end = { name: 'Chamarel', latitude: -20.4281, longitude: 57.3742 }
start_location = StartLocation.create(
  latitude: ville_start[:latitude],
  longitude: ville_start[:longitude],
  address: ville_start[:name]
)
end_location = EndLocation.create(
  latitude: ville_end[:latitude],
  longitude: ville_end[:longitude],
  address: ville_end[:name]
)

futur_ride_elodie_seed = Ride.create(
  start_location: start_location,
  end_location: end_location,
  ride_details: "Non smoking ride, pet accepted",
  distance: 32,
  start_time: "June 24, 2023 8:30 AM",
  end_time: "June 24, 2023 10:00 AM",
  price: 150,
  seats: 4,
  vehicule_id: vehicule_elodie_seed.id
)
puts "Created a ride with id: #{futur_ride_elodie_seed.id}"

puts "creation d'un booking pour preview ride d'abhay"
booking_elodie = Booking.create(
  ride_id: futur_ride_elodie_seed.id,
  user_id: george.id
)
puts "creation 1 review pour elodie"
Review.create(
  rating: 5,
  comment: "Super ride in good company",
  timestamp: Time.now,
  user_id: george.id,
  booking_id: booking_elodie.id
)

#----------------------------#
puts "Creating abhay"
abhay = User.create(
  email: 'abhay@gmail.com',
  password: 'password',
  first_name: "Abhay",
  last_name: "BZZH",
  age: 20,
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5)
 )
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/286b03b2ad1c09bf52cbcc99a4dabba4_clsh1e.jpg")
abhay.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
abhay.save
puts "created abhay photo"

puts "Creating a vehicle for abhay..."
vehicule_abhay_seed = Vehicule.create(
  model: "Hilux",
  registration_detail: Faker::Vehicle.license_plate,
  user_id: abhay.id
)
puts "Creating 2 ride for abhay..."
ville_start = { name: 'Trou aux Biches', latitude: -20.0378, longitude: 57.5477 }
ville_end = { name: 'Chamarel', latitude: -20.4281, longitude: 57.3742 }
start_location = StartLocation.create(
  latitude: ville_start[:latitude],
  longitude: ville_start[:longitude],
  address: ville_start[:name]
)
end_location = EndLocation.create(
  latitude: ville_end[:latitude],
  longitude: ville_end[:longitude],
  address: ville_end[:name]
)

futur_ride_abhay_seed = Ride.create(
  start_location: start_location,
  end_location: end_location,
  ride_details: "Non smoking ride, pet accepted",
  distance: 32,
  start_time: "June 24, 2023 13:00 PM",
  end_time: "June 24, 2023 14:30 PM",
  price: 150,
  seats: 4,
  vehicule_id: vehicule_abhay_seed.id
)
puts "Created a ride with id: #{futur_ride_abhay_seed.id}"



ville_start = VILLE.sample
ville_end = VILLE.reject { |v| v[:name] == ville_start[:name] }.sample
start_location = StartLocation.create(
  latitude: ville_start[:latitude],
  longitude: ville_start[:longitude],
  address: ville_start[:name]
)
end_location = EndLocation.create(
  latitude: ville_end[:latitude],
  longitude: ville_end[:longitude],
  address: ville_end[:name]
)

start_time_previews_abhay_seed = Faker::Time.between_dates(from: Date.today - 7, to: Date.today - 1, period: :all)
duration = Time.parse("0#{rand(1..2)}:#{rand(0..5)}0:00").seconds_since_midnight.seconds
end_time_abhay_previews_seed = start_time_previews_abhay_seed + duration

previews_ride_abhay_seed = Ride.create(
  start_location: start_location,
  end_location: end_location,
  ride_details: Faker::Lorem.sentence,
  distance: rand(1..50),
  start_time: start_time_previews_abhay_seed,
  end_time: end_time_abhay_previews_seed,
  price: rand(10..100),
  seats: rand(1..4),
  vehicule_id: vehicule_abhay_seed.id
)
puts "Created a ride with id: #{previews_ride_abhay_seed.id}"

puts "creation d'un booking pour preview ride d'abhay"
booking_abhay = Booking.create(
  ride_id: previews_ride_abhay_seed.id,
  user_id: milou.id
)
puts "creation 1 review pour abhay"
Review.create(
  rating: 4,
  comment: "Nice driver",
  timestamp: Time.now,
  user_id: milou.id,
  booking_id: booking_abhay.id
)

puts "Seeding completed successfully!"
