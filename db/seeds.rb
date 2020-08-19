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

camp1 = Lodging.create(lodge_type: "Camp", number: 1 , price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 2, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 3, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 4, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 5, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 6, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 7, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 8, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 9, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")
Lodging.create(lodge_type: "Camp", number: 10, price: 50, description: "Amazing view of the mountain-side, large enough for a 4-person tent.")

cabin1 = Lodging.create(lodge_type: "Cabin", number: 1 ,price: 150, description: "Amazing view of the mountain-side, large enough for a 4-person tent")
Lodging.create(lodge_type: "Cabin", number: 2, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 3, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 4, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 5, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 6, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 7, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 8, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 9, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")
Lodging.create(lodge_type: "Cabin", number: 10, price: 200, description: "This cabin has luxurious amenities. Capacity for 4 people.")


lp1 = LiftPass.create(pass_type: "Day" ,duration: 1 ,price: 50, user_id: dan.id)
lp2 = LiftPass.create(pass_type: "Day" ,duration: 7 ,price: 50, user_id: ben.id)

Equipment.create(sport: "Bike", equipment_type: "Enduro Bike", eq_name: "SC Bronson", size: "S", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Enduro Bike", eq_name: "SC Bronson", size: "M", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Enduro Bike", eq_name: "SC Bronson", size: "L", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Enduro Bike", eq_name: "SC Bronson", size: "XL", purchase_price: 8000, rental_price: 100, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Enduro Bike", eq_name: "SC Bronson", size: "XXL", purchase_price: 8000, rental_price: 100, stock: 1)
Equipment.create(sport: "Bike", equipment_type: "Mini DH Bike", eq_name: "SC Nomad", size: "S", purchase_price: 9000, rental_price: 125, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Mini DH Bike", eq_name: "SC Nomad", size: "M", purchase_price: 9000, rental_price: 125, stock: 5)
eq1 = Equipment.create(sport: "Bike", equipment_type: "Mini DH Bike", eq_name: "SC Nomad", size: "L", purchase_price: 9000, rental_price: 125, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Mini DH Bike", eq_name: "SC Nomad", size: "XL", purchase_price: 9000, rental_price: 125, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "Mini DH Bike", eq_name: "SC Nomad", size: "XXL", purchase_price: 9000, rental_price: 125, stock: 1)
Equipment.create(sport: "Bike", equipment_type: "DH Bike", eq_name: "SC V-10", size: "S", purchase_price: 11000, rental_price: 150, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "DH Bike", eq_name: "SC V-10", size: "M", purchase_price: 11000, rental_price: 150, stock: 5)
eq2 = Equipment.create(sport: "Bike", equipment_type: "DH Bike", eq_name: "SC V-10", size: "L", purchase_price: 11000, rental_price: 150, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "DH Bike", eq_name: "SC V-10", size: "XL", purchase_price: 11000, rental_price: 150, stock: 5)
Equipment.create(sport: "Bike", equipment_type: "DH Bike", eq_name: "SC V-10", size: "XXL", purchase_price: 11000, rental_price: 150, stock: 1)

Equipment.create(sport: "Bike", equipment_type: "Full-Face Helmet", eq_name: "POC Coron Air", size: "S", purchase_price: 250, rental_price: 20, stock: 20)
Equipment.create(sport: "Bike", equipment_type: "Full-Face Helmet", eq_name: "POC Coron Air", size: "M", purchase_price: 250, rental_price: 20, stock: 20)
Equipment.create(sport: "Bike", equipment_type: "Full-Face Helmet", eq_name: "POC Coron Air", size: "L", purchase_price: 250, rental_price: 20, stock: 18)
Equipment.create(sport: "Bike", equipment_type: "Full-Face Helmet", eq_name: "POC Coron Air", size: "XL", purchase_price: 250, rental_price: 20, stock: 15)

Equipment.create(sport: "Bike", equipment_type: "Set of Pads", eq_name: "ION K-Pact", size: "S", purchase_price: 200, rental_price: 15, stock: 15)
Equipment.create(sport: "Bike", equipment_type: "Set of Pads", eq_name: "ION K-Pact", size: "M", purchase_price: 200, rental_price: 15, stock: 15)
Equipment.create(sport: "Bike", equipment_type: "Set of Pads", eq_name: "ION K-Pact", size: "L", purchase_price: 200, rental_price: 15, stock: 18)
Equipment.create(sport: "Bike", equipment_type: "Set of Pads", eq_name: "ION K-Pact", size: "XL", purchase_price: 200, rental_price: 15, stock: 15)

Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core", size: "S", purchase_price: 40, rental_price: 5, stock: 15)
Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core", size: "M", purchase_price: 40, rental_price: 5, stock: 15)
Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core", size: "L", purchase_price: 40, rental_price: 5, stock: 18)
Equipment.create(sport: "Bike", equipment_type: "Gloves", eq_name: "100% R-Core", size: "XL", purchase_price: 40, rental_price: 5, stock: 15)

Equipment.create(sport: "Bike", equipment_type: "Goggles", eq_name: "Smith Squad Goggs", size: "S", purchase_price: 80, rental_price: 10, stock: 63)

gb1 = GearBag.create(bikegear: [eq1])
gb2 = GearBag.create(bikegear: [eq2])

res1 = Reservation.create(start_date: "2020-08-01", end_date: "2020-08-02", user_id: dan.id, gear_bag_id: gb1.id, rent_eq: false, lodging_id: camp1.id, lift_pass_id: lp1.id, total_cost: 200)
res2 = Reservation.create(start_date: "2020-08-01", end_date: "2020-08-07", user_id: ben.id, gear_bag_id: gb2.id, rent_eq: false, lodging_id: cabin1.id, lift_pass_id: lp2.id, total_cost: 2275)

