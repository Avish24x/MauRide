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
Review.delete_all
Booking.delete_all
StartLocation.delete_all
EndLocation.destroy_all
Ride.delete_all
Vehicule.delete_all
User.delete_all

puts "Creating users..."

User.create(
  email: 'test@gmail.com',
  password: 'password',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  age: rand(18..60),
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5),
  account_status: 'user'
)

# Create a passenger user
passenger_seed = User.create(
  email: Faker::Internet.email,
  password: 'FF1234',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  age: rand(18..60),
  location: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  payment_details: Faker::Finance.credit_card,
  rating: rand(0..5),
  account_status: 'user'
)
puts "Created a passenger user."

# Create multiple driver users
3.times do
  driver_seed = User.create(
    email: Faker::Internet.email,
    password: 'FF1234',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..60),
    location: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    payment_details: Faker::Finance.credit_card,
    rating: rand(0..5),
    account_status: 'driver'
  )
  puts "Created a driver user."

  puts "Creating a vehicle for the driver..."
  vehicule_seed = Vehicule.create(
    model: Faker::Vehicle.make_and_model,
    registration_detail: Faker::Vehicle.standard_specs,
    user_id: driver_seed.id
  )
  puts "Created a vehicle for the driver."

  puts "Creating rides for the driver..."
  rand(1..3).times do
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
  end
end

puts "Seeding completed successfully!"
