# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dan = User.create(name: "Daniel Cole", age: 28, email:"dan@gmail.com", username: "dan", password: "daniel", password_confirmation: "daniel", admin: true)
ben = User.create(name: "Ben Ebomwonyi", age: 22, email:"ben@gmail.com", username: "ben", password: "benjamin", password_confirmation: "benjamin", admin: true)

camp1 = Lodging.create(lodge_type: "Camp", number: 1 ,price: 50)
cabin1 = Lodging.create(lodge_type: "Cabin", number: 1 ,price: 150)

lp1 = LiftPass.create(pass_type: "Day" ,duration: 1 ,price: 50, user_id: dan.id)
lp2 = LiftPass.create(pass_type: "Day" ,duration: 7 ,price: 50, user_id: ben.id)

eq1 = Equipment.create(sport: "Bike", equipment_type: "Bicycle", eq_name: "SC Nomad", size: "L", purchase_price: 9000 ,rental_price: 100, stock: 5)
eq2 = Equipment.create(sport: "Bike", equipment_type: "Bicycle", eq_name: "SC V-10", size: "XL", purchase_price: 11000 ,rental_price: 125, stock: 12)

res1 = Reservation.create(start_date: "2020-08-01", end_date: "2020-08-02", user_id: dan.id, equipment_id: eq1.id, rent_eq: false, lodging_id: camp1.id, lift_pass_id: lp1.id, total_cost: 200)
res2 = Reservation.create(start_date: "2020-08-01", end_date: "2020-08-07", user_id: ben.id, equipment_id: eq2.id, rent_eq: false, lodging_id: cabin1.id, lift_pass_id: lp2.id, total_cost: 2275)

