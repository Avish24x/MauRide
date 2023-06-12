
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

images = [
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709559/michael-dam-mEZ3PoFGs_k-unsplash_x8tzt6.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709269/d222f555b4b52852aa154cbde8d10d5f_caxeux.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/d8d6410ae0c317178e1318f4ca97ea21_yw9spx.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/cdbd10b2cdf094e27613944f8819b19f_q1qaxc.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/ca1d3c06d5e8554a992201ea492dfe12_vjveut.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/81159f3a28fd2485583af22bb9ccbaa3_uu2pon.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/a4c4c4b69fefdde32120eeb8f8e4a868_kmaatt.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/1956fdd05b46365e97637c6e365ed1e8_mqz5i8.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/c69866f67f2a18b4174c0234cea6091e_nxqis0.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/18aa589555075bb52b5cf7bdffcb8303_urh45w.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/4578268aa891b23eb3ac2e94593a5ad0_wod1o3.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/b565e1c9446b16de368ba4c0a2285b4e_vgq3ih.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/acaab8a714a131e2f2850373941ab041_pswdl7.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/628c9ae1c43a4e4f7118e064df75ec4d_vm2dn6.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/97d60039fe121219664cd5d9139f40cd_dqnkhk.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/286b03b2ad1c09bf52cbcc99a4dabba4_clsh1e.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/3fe3f26973354cf39e7085de3ec72609_zfitao.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/3a495b99baba5026fd41c9c1cd342a2e_gvznas.jpg"
]
puts "Deleting existing data..."
Review.delete_all
Booking.delete_all
StartLocation.delete_all
EndLocation.destroy_all
Ride.delete_all
Vehicule.delete_all
User.delete_all

puts "Creating users..."

user_test = User.create(
  email: 'test@gmail.com',
  password: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  age: rand(18..60),
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5)
)
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/12db5a981fb89864eee3cc19445493dc_lb9d8v.jpg")
user_test.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
puts "created user_test photo"
user_test.save




puts "Created a passenger user."
# Create multiple driver users
3.times do |index|
  driver_seed = User.create(
    email: Faker::Internet.email,
    password: 'FF1234',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..60),
    location: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    payment_details: Faker::Finance.credit_card,
    rating: rand(0..5)
  )
  puts "Created a driver user."

  puts "Adding a photo"
  file = URI.open(images[index])
  driver_seed.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "created driver photo"
  driver_seed.save

  puts "Creating a vehicle for the driver..."
  vehicule_seed = Vehicule.create(
    model: Faker::Vehicle.make_and_model,
    registration_detail: Faker::Vehicle.standard_specs,
    user_id: driver_seed.id
  )
  puts "Created a vehicle for the driver."

  puts "Creating 1 ride for the driver..."
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
  ride_seed = Ride.create(
    start_location: start_location,
    end_location: end_location,
    ride_details: Faker::Lorem.sentence,
    distance: rand(1..50),
    start_time: Faker::Time.between_dates(from: Date.today - 7, to: Date.today, period: :all),
    end_time: Faker::Time.between_dates(from: Date.today, to: Date.today + 7, period: :all),
    price: rand(10..100),
    seats: rand(1..4),
    vehicule_id: vehicule_seed.id
  )
  puts "Created a ride with id: #{ride_seed.id}"

  # Create a passenger user
  passenger_seed = User.create(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..60),
    location: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    payment_details: Faker::Finance.credit_card,
    rating: rand(0..5)
  )
  file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/18aa589555075bb52b5cf7bdffcb8303_urh45w.jpg")
  passenger_seed.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "created passenger_seed photo"
  passenger_seed.save

  puts "creation d'un booking par ride"
  Booking.create(
    ride_id: ride_seed.id,
    user_id: passenger_seed.id
  )

  puts "creation d'1 à 2 review par ride"
  # les reviews sont créees par un seul user(passenger pour l'instant)
  rand(0..2).times do
    Review.create(
      rating: rand(0..5),
      comment: Faker::Quote.matz,
      timestamp: Time.now,
      user_id: passenger_seed.id,
      ride_id: ride_seed.id
    )
  end
end
puts "Seeding completed successfully!"
