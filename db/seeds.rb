
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

VILLES = [
  { name: "	Curepipe	" , latitude:	-20.3188	,longitude:	57.5263	},
  { name: "	Port Louis	" , latitude:	-20.1644	,longitude:	57.5042	},
  { name: "	Quatre Bornes	" , latitude:	-20.2654	,longitude:	57.4791	},
  { name: "	Quartier Militaire	" , latitude:	-20.2500	,longitude:	57.5500	},
  { name: "	Goodlands	" , latitude:	-20.0350	,longitude:	57.6431	},
  { name: "	Le Hochet	" , latitude:	-20.1350	,longitude:	57.5211	},
  { name: "	Rose Belle	" , latitude:	-20.4025	,longitude:	57.6061	},
  { name: "	Surinam	" , latitude:	-20.5139	,longitude:	57.5111	},
  { name: "	Ebène	" , latitude:	-20.2431	,longitude:	57.4917	},
  { name: "	Rose Hill	" , latitude:	-20.2441	,longitude:	57.4719	},
  { name: "	Plaisance	" , latitude:	-20.2421	,longitude:	57.4610	},
  { name: "	Stanley	" , latitude:	-20.2503	,longitude:	57.4597	},
  { name: "	Mahébourg	" , latitude:	-20.4000	,longitude:	57.7000	},
  { name: "	Beau Bassin	" , latitude:	-20.2276	,longitude:	57.4681	},
  { name: "	La Source	" , latitude:	-20.2711	,longitude:	57.4625	},
  { name: "	Engrais Martial	" , latitude:	-20.3003	,longitude:	57.5094	},
  { name: "	Floréal	" , latitude:	-20.3094	,longitude:	57.5008	},
  { name: "	Eaux Coulée	" , latitude:	-20.3042	,longitude:	57.5175	},
  { name: "	Malherbes	" , latitude:	-20.3092	,longitude:	57.5247	},
  { name: "	Carreau La Liane	" , latitude:	-20.2806	,longitude:	57.4764	},
  { name: "	Mare Samson	" , latitude:	-20.1714	,longitude:	57.4417	},
  { name: "	Pellegrin	" , latitude:	-20.2594	,longitude:	57.4905	},
  { name: "	Camp Caval	" , latitude:	-20.3200	,longitude:	57.5019	},
  { name: "	Petit Verger	" , latitude:	-20.1756	,longitude:	57.4336	},
  { name: "	Petit Camp	" , latitude:	-20.2698	,longitude:	57.4976	},
  { name: "	Riche Terre	" , latitude:	-20.1331	,longitude:	57.5247	},
  { name: "	Richelieu	" , latitude:	-20.1932	,longitude:	57.4595	},
  { name: "	Chébel	" , latitude:	-20.2030	,longitude:	57.4580	},
  { name: "	Grand River North West	" , latitude:	-20.1779	,longitude:	57.4765	},
  { name: "	Les Casernes	" , latitude:	-20.3261	,longitude:	57.4986	},
  { name: "	La Rotraite	" , latitude:	-20.2000	,longitude:	57.4667	},
  { name: "	Coromandel	" , latitude:	-20.1879	,longitude:	57.4659	},
  { name: "	Terre Rouge	" , latitude:	-20.1283	,longitude:	57.5312	},
  { name: "	Belle Étoile	" , latitude:	-20.2047	,longitude:	57.4705	},
  { name: "	Forest Side	" , latitude:	-20.3200	,longitude:	57.5306	},
  { name: "	Engrais Cathan	" , latitude:	-20.2992	,longitude:	57.5186	},
  { name: "	Solférino	" , latitude:	-20.2908	,longitude:	57.4672	},
  { name: "	Bonne Terre	" , latitude:	-20.2878	,longitude:	57.4756	},
  { name: "	River Side	" , latitude:	-20.2775	,longitude:	57.4967	},
  { name: "	Trianon	" , latitude:	-20.2558	,longitude:	57.4942	},
  { name: "	Vacoas	" , latitude:	-20.2981	,longitude:	57.4783	},
  { name: "	Ville Noire	" , latitude:	-20.4019	,longitude:	57.6947	},
  { name: "	Holyrood	" , latitude:	-20.3097	,longitude:	57.4675	},
  { name: "	Bois Marchand	" , latitude:	-20.1233	,longitude:	57.5331	},
  { name: "	Bois Pignolet	" , latitude:	-20.1324	,longitude:	57.5446	},
  { name: "	La Cocoterie	" , latitude:	-20.1316	,longitude:	57.5016	},
  { name: "	Richeterre	" , latitude:	-20.1167	,longitude:	57.5000	},
  { name: "	Camp La Savanne	" , latitude:	-20.3250	,longitude:	57.4686	},
  { name: "	Camp Roches	" , latitude:	-20.3219	,longitude:	57.4678	},
  { name: "	Mesnil	" , latitude:	-20.2903	,longitude:	57.5117	},
  { name: "	La Croisée	" , latitude:	-20.3186	,longitude:	57.4783	},
  { name: "	Glen Park	" , latitude:	-20.3211	,longitude:	57.4783	},
  { name: "	Petite Rivière	" , latitude:	-20.1894	,longitude:	57.4453	},
  { name: "	Réunion	" , latitude:	-20.3092	,longitude:	57.4881	},
  { name: "	La Marie	" , latitude:	-20.3350	,longitude:	57.4850	},
  { name: "	Camp Mapou	" , latitude:	-20.3322	,longitude:	57.4653	},
  { name: "	La Rosa	" , latitude:	-20.4136	,longitude:	57.6169	},
  { name: "	New Grove	" , latitude:	-20.4086	,longitude:	57.6136	},
  { name: "	Phoenix	" , latitude:	-20.2867	,longitude:	57.5022	},
  { name: "	Saint Paul	" , latitude:	-20.2878	,longitude:	57.5044	},
  { name: "	Mare d’Albert	" , latitude:	-20.4186	,longitude:	57.6228	},
  { name: "	Morcellemont Saint André	" , latitude:	-20.0731	,longitude:	57.5581	},
  { name: "	Triolet	" , latitude:	-20.0500	,longitude:	57.5500	},
  { name: "	Gros Billot	" , latitude:	-20.4164	,longitude:	57.6031	},
  { name: "	Bois d’Oiseaux	" , latitude:	-20.4131	,longitude:	57.6000	},
  { name: "	Camp Fouquereaux	" , latitude:	-20.2869	,longitude:	57.5211	},
  { name: "	Khoyratty	" , latitude:	-20.1206	,longitude:	57.5475	},
  { name: "	Bagatelle	" , latitude:	-20.2555	,longitude:	57.5205	},
  { name: "	Highlands	" , latitude:	-20.2780	,longitude:	57.5163	},
  { name: "	Belle Terre	" , latitude:	-20.2659	,longitude:	57.5219	},
  { name: "	Valentina	" , latitude:	-20.2757	,longitude:	57.5056	},
  { name: "	Saint Antoine	" , latitude:	-20.2814	,longitude:	57.5239	},
  { name: "	Grand dans Fond	" , latitude:	-20.1811	,longitude:	57.6667	},
  { name: "	Solitude	" , latitude:	-20.0769	,longitude:	57.5386	},
  { name: "	Bon Air	" , latitude:	-20.0619	,longitude:	57.5619	},
  { name: "	Cinq Arpents	" , latitude:	-20.2710	,longitude:	57.5309	},
  { name: "	Petit Verger	" , latitude:	-20.2163	,longitude:	57.5257	},
  { name: "	Saint Pierre	" , latitude:	-20.2167	,longitude:	57.5167	},
  { name: "	Rivière Baptiste	" , latitude:	-20.2097	,longitude:	57.5357	},
  { name: "	Belle Rose	" , latitude:	-20.2150	,longitude:	57.5183	},
  { name: "	L’Union	" , latitude:	-20.5000	,longitude:	57.4667	},
  { name: "	Saint Felix	" , latitude:	-20.5017	,longitude:	57.4606	},
  { name: "	Pomponnette	" , latitude:	-20.5094	,longitude:	57.4803	},
  { name: "	Mamzelle Jeanne	" , latitude:	-20.0303	,longitude:	57.6497	},
  { name: "	Saint Antoine	" , latitude:	-20.0417	,longitude:	57.6536	},
  { name: "	Belmont	" , latitude:	-20.0450	,longitude:	57.6586	},
  { name: "	Roche Terre	" , latitude:	-20.0186	,longitude:	57.6447	},
  { name: "	Médine	" , latitude:	-20.2422	,longitude:	57.6425	},
  { name: "	Bel Étang	" , latitude:	-20.2397	,longitude:	57.6564	},
  { name: "	Madame Azor	" , latitude:	-20.0300	,longitude:	57.6611	},
  { name: "	Mon Désert	" , latitude:	-20.2263	,longitude:	57.5353	},
  { name: "	Camp Auguste	" , latitude:	-20.2415	,longitude:	57.5346	},
  { name: "	Côte d’Or	" , latitude:	-20.2494	,longitude:	57.5356	},
  { name: "	Trou aux Biches	" , latitude:	-20.0450	,longitude:	57.5461	},
  { name: "	Belvédère	" , latitude:	-20.1961	,longitude:	57.6639	},
  { name: "	Riambel	" , latitude:	-20.5150	,longitude:	57.5000	},
  { name: "	Cottage	" , latitude:	-20.0597	,longitude:	57.6292	},
  { name: "	Forbach	" , latitude:	-20.0644	,longitude:	57.6258	},
  { name: "	Notre Dame	" , latitude:	-20.1430	,longitude:	57.5597	},
  { name: "	Long Mountain	" , latitude:	-20.1431	,longitude:	57.5622	},
  { name: "	Pereybèré	" , latitude:	-19.9906	,longitude:	57.5856	}
]





images_drivers = [
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709266/12db5a981fb89864eee3cc19445493dc_lb9d8v.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709559/michael-dam-mEZ3PoFGs_k-unsplash_x8tzt6.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709269/d222f555b4b52852aa154cbde8d10d5f_caxeux.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/d8d6410ae0c317178e1318f4ca97ea21_yw9spx.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/cdbd10b2cdf094e27613944f8819b19f_q1qaxc.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/ca1d3c06d5e8554a992201ea492dfe12_vjveut.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/81159f3a28fd2485583af22bb9ccbaa3_uu2pon.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/a4c4c4b69fefdde32120eeb8f8e4a868_kmaatt.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/1956fdd05b46365e97637c6e365ed1e8_mqz5i8.jpg",
  "https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/c69866f67f2a18b4174c0234cea6091e_nxqis0.jpg"
]

images_passengers = [

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

puts "Creating users..."

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
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709267/97d60039fe121219664cd5d9139f40cd_dqnkhk.jpg")
elodie.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
elodie.save
puts "created elodie photo"

puts "Creating a vehicle for elodie..."
vehicule_elodie_seed = Vehicule.create(
  model: Faker::Vehicle.make_and_model,
  registration_detail: Faker::Vehicle.license_plate,
  user_id: elodie.id
)
puts "Created a vehicle for elodie."

puts "Creating 1 ride for elodie..."
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

start_time_futur_elodie_seed = Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 7, period: :all)
start_time_previews_elodie_seed = Faker::Time.between_dates(from: Date.today - 7, to: Date.today - 1, period: :all)
puts "avant duration"
duration = Time.parse("0#{rand(1..2)}:#{rand(0..5)}0:00").seconds_since_midnight.seconds
puts "apres duration"
end_time_elodie_futur_seed = start_time_futur_elodie_seed + duration
end_time_elodie_previews_seed = start_time_previews_elodie_seed + duration

futur_ride_elodie_seed = Ride.create(
  start_location: start_location,
  end_location: end_location,
  ride_details: Faker::Lorem.sentence,
  distance: rand(1..50),
  start_time: start_time_futur_elodie_seed,
  end_time: end_time_elodie_futur_seed,
  price: rand(10..100),
  seats: rand(1..4),
  vehicule_id: vehicule_elodie_seed.id

)
puts "Created a ride with id: #{futur_ride_elodie_seed.id}"

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

previews_ride_elodie_seed = Ride.create(
  start_location: start_location,
  end_location: end_location,
  ride_details: Faker::Lorem.sentence,
  distance: rand(1..50),
  start_time: start_time_previews_elodie_seed,
  end_time: end_time_elodie_previews_seed,
  price: rand(10..100),
  seats: rand(1..4),
  vehicule_id: vehicule_elodie_seed.id
)
puts "Created a ride with id: #{previews_ride_elodie_seed.id}"

puts "creation d'un booking pour preview ride d'elodie"
Booking.create(
  ride_id: previews_ride_elodie_seed.id,
  user_id: lea.id
)


abhay = User.create(
  email: 'abhay@gmail.com',
  password: 'password',
  first_name: "abhay",
  last_name: "b",
  age: 27
 )
file = URI.open("https://res.cloudinary.com/dyzvwwvns/image/upload/v1685709268/c69866f67f2a18b4174c0234cea6091e_nxqis0.jpg")
abhay.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
abhay.save
puts "created abhay photo"

puts "creating 10 drivers"
10.times do |index|
  driver_seed = User.create(
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
  puts "Created a driver user."

  puts "Adding a photo"
  file = URI.open(images_drivers[rand(0..9)])
  driver_seed.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
  puts "created driver photo"
  driver_seed.save

  puts "Creating a vehicle for the driver..."
  vehicule_seed = Vehicule.create(
    model: Faker::Vehicle.make_and_model,
    registration_detail: Faker::Vehicle.license_plate,
    user_id: driver_seed.id
  )
  puts "Created a vehicle for the driver."

  puts "Creating 1 ride for the driver..."
  # ville_start = VILLE.sample
  ville_start = VILLE[index]

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

  start_time_seed = Faker::Time.between_dates(from: Date.today - 1, to: Date.today + 7, period: :all)
  duration = Time.parse("0#{rand(1..2)}:#{rand(0..5)}0:00").seconds_since_midnight.seconds
  end_time_seed = start_time_seed + duration

  ride_seed = Ride.create(
    start_location: start_location,
    end_location: end_location,
    ride_details: Faker::Lorem.sentence,
    distance: rand(1..50),
    start_time: start_time_seed,
    end_time: end_time_seed,
    price: rand(10..100),
    seats: rand(1..4),
    vehicule_id: vehicule_seed.id
  )
  puts "Created a ride with id: #{ride_seed.id}"

  # Create 1 or 2 passengers
  rand(1..2).times do
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
    index_photo_passenger = rand(0..8)
    file = URI.open(images_passengers[index_photo_passenger])
    passenger_seed.photo.attach(io: file, filename: 'test.png', content_type: 'image/png')
    puts "created passenger_seed photo"
    passenger_seed.save

    puts "creation d'un booking par ride"
    rand(0..2).times do
      Booking.create(
        ride_id: ride_seed.id,
        user_id: passenger_seed.id
      )
    end

    puts "creation d'0 à 1 review par ride par passager"
    rand(0..1).times do
      Review.create(
        rating: rand(0..5),
        comment: Faker::Quote.matz,
        timestamp: Time.now,
        user_id: passenger_seed.id, # le review appartient au passager
        ride_id: ride_seed.id
      )
    end
  end
end
puts "Seeding completed successfully!"
