
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dan = User.create(name: "Daniel Cole", age: 28, email:"dan@gmail.com", username: "dan", password: "daniel", password_confirmation: "daniel", admin: true)
ben = User.create(name: "Ben Ebomwonyi", age: 22, email:"ben@gmail.com", username: "ben", password: "benjamin", password_confirmation: "benjamin", admin: true)
tony = User.create(name: "Tony Tiger", age: 50, email:"tony@gmail.com", username: "tony", password: "tigers", password_confirmation: "tigers", admin: false)

camp1 = Lodging.create(lodging_name: "Camp 1", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodging_name: "Camp 2", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodging_name: "Camp 3", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.").rent
Lodging.create(lodging_name: "Camp 4", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodging_name: "Camp 5", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.").rent
Lodging.create(lodging_name: "Camp 6", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.").rent
Lodging.create(lodging_name: "Camp 7", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodging_name: "Camp 8", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.").rent
Lodging.create(lodging_name: "Camp 9", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodging_name: "Camp 10", price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")

cabin1 = Lodging.create(lodging_name: "Cabin 1", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
cabin2 = Lodging.create(lodging_name: "Cabin 2", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
cabin3 = Lodging.create(lodging_name: "Cabin 3", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodging_name: "Cabin 4", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodging_name: "Cabin 5", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.").rent
Lodging.create(lodging_name: "Cabin 6", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodging_name: "Cabin 7", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.").rent
Lodging.create(lodging_name: "Cabin 8", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodging_name: "Cabin 9", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.").rent
Lodging.create(lodging_name: "Cabin 10", price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")


lp1 = LiftPass.create(start_date: "2020-08-30", end_date: "2020-09-05", duration: 1, price: 50, user_id: dan.id)
lp2 = LiftPass.create(start_date: "2020-08-30", end_date: "2020-09-09", duration: 6, price: 50, user_id: ben.id)
lp3 = LiftPass.new(start_date: "2020-08-01", end_date: "2020-09-05", duration: 4, price: 50, user_id: dan.id).save(validate: false)
lp4 = LiftPass.new(start_date: "2020-08-01", end_date: "2020-09-05", duration: 4, price: 50, user_id: ben.id).save(validate: false)
lp5 = LiftPass.new(start_date: "2020-08-01", end_date: "2020-09-05", duration: 4, price: 50, user_id: tony.id).save(validate: false)


Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Bronson - S", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Bronson - M", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Bronson - L", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Bronson - XL", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Bronson - XXL", purchase_price: 8000, rental_price: 100, stock: 1)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Nomad - S", purchase_price: 9000, rental_price: 125, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Nomad - M", purchase_price: 9000, rental_price: 125, stock: 5)
eq1 = Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Nomad - L", purchase_price: 9000, rental_price: 125, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Nomad - XL", purchase_price: 9000, rental_price: 125, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC Nomad - XXL", purchase_price: 9000, rental_price: 125, stock: 1)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC V-10 - S", purchase_price: 11000, rental_price: 150, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC V-10 - M", purchase_price: 11000, rental_price: 150, stock: 5)
eq2 = Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC V-10 - L", purchase_price: 11000, rental_price: 150, stock: 5)
eq3 = Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC V-10 - XL", purchase_price: 11000, rental_price: 150, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Bike", eq_name: "SC V-10 - XXL", purchase_price: 11000, rental_price: 150, stock: 1)

Equipment.create(sport: "Bike", equipment_type: "Helmet", eq_name: "POC Coron Air - S", purchase_price: 250, rental_price: 20, stock: 20)
Equipment.create(sport: "Bike", equipment_type: "Helmet", eq_name: "POC Coron Air - M", purchase_price: 250, rental_price: 20, stock: 20)
eq4 = Equipment.create(sport: "Bike", equipment_type: "Helmet", eq_name: "POC Coron Air - L", purchase_price: 250, rental_price: 20, stock: 18)
Equipment.create(sport: "Bike", equipment_type: "Helmet", eq_name: "POC Coron Air - XL", purchase_price: 250, rental_price: 20, stock: 15)

Equipment.create(sport: "Bike", equipment_type: "Pads", eq_name: "ION K-Pact - S", purchase_price: 200, rental_price: 15, stock: 15)
Equipment.create(sport: "Bike", equipment_type: "Pads", eq_name: "ION K-Pact - M", purchase_price: 200, rental_price: 15, stock: 15)
eq5 = Equipment.create(sport: "Bike", equipment_type: "Pads", eq_name: "ION K-Pact - L", purchase_price: 200, rental_price: 15, stock: 18)
Equipment.create(sport: "Bike", equipment_type: "Pads", eq_name: "ION K-Pact - XL", purchase_price: 200, rental_price: 15, stock: 15)

Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core - S", purchase_price: 40, rental_price: 5, stock: 15)
Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core - M", purchase_price: 40, rental_price: 5, stock: 15)
eq6 = Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core - L", purchase_price: 40, rental_price: 5, stock: 18)
Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core - XL", purchase_price: 40, rental_price: 5, stock: 15)

eq7 = Equipment.create(sport: "Bike", equipment_type: "Goggles", eq_name: "Smith Squad Goggs", purchase_price: 80, rental_price: 10, stock: 32)
Equipment.create(sport: "Bike", equipment_type: "Goggles", eq_name: "Oakley Airbrake", purchase_price: 200, rental_price: 20, stock: 31)

gb1 = GearBag.create(start_date: "2020-08-30", end_date: "2020-09-05", duration: 1, bike_id: eq1.id, helmet_id: eq4.id, pads_id: eq5.id, gloves_id: eq6.id, goggles_id: eq7.id, user_id: dan.id)
gb2 = GearBag.create(start_date: "2020-08-30", end_date: "2020-09-05", duration: 6, bike_id: eq2.id, helmet_id: eq4.id, pads_id: eq5.id, gloves_id: eq6.id, goggles_id: eq7.id, user_id: ben.id)
gb3 = GearBag.new(start_date: "2020-08-01", end_date: "2020-08-05", duration: 4, bike_id: eq1.id, helmet_id: eq4.id, pads_id: eq5.id, gloves_id: eq6.id, goggles_id: eq7.id, user_id: dan.id).save(validate: false)
gb4 = GearBag.new(start_date: "2020-08-01", end_date: "2020-08-05", duration: 4, bike_id: eq2.id, helmet_id: eq4.id, pads_id: eq5.id, gloves_id: eq6.id, goggles_id: eq7.id, user_id: ben.id).save(validate: false)
gb5 = GearBag.new(start_date: "2020-08-01", end_date: "2020-08-05", duration: 4, bike_id: eq3.id , helmet_id: eq4.id, pads_id: eq5.id, gloves_id: eq6.id, goggles_id: eq7.id, user_id: tony.id).save(validate: false)

res1 = Reservation.create(start_date: "2020-08-30", end_date: "2020-09-05", duration: 1, user_id: dan.id, gear_bag_id: gb1.id, rent_eq: true, lodging_id: camp1.id, lift_pass_id: lp1.id, total_cost: 200)
res2 = Reservation.create(start_date: "2020-08-30", end_date: "2020-09-09", duration: 6, user_id: ben.id, gear_bag_id: gb2.id, rent_eq: true, lodging_id: cabin1.id, lift_pass_id: lp2.id, total_cost: 2275)
res3 = Reservation.new(start_date: "2020-08-01", end_date: "2020-08-05", duration: 4, user_id: dan.id, gear_bag_id: 3, rent_eq: true, lodging_id: 11, lift_pass_id: 3, total_cost: 1700).save(validate: false)
res4 = Reservation.new(start_date: "2020-08-01", end_date: "2020-08-05", duration: 4, user_id: ben.id, gear_bag_id: 4, rent_eq: true, lodging_id: 12, lift_pass_id: 4, total_cost: 1800).save(validate: false)
res5 = Reservation.new(start_date: "2020-08-01", end_date: "2020-08-05", duration: 4, user_id: tony.id, gear_bag_id: 5, rent_eq: true, lodging_id: 13, lift_pass_id: 5, total_cost: 1800).save(validate: false)