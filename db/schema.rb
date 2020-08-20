# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_18_234732) do

  create_table "equipment", force: :cascade do |t|
    t.string "sport"
    t.string "equipment_type"
    t.string "eq_name"
    t.integer "purchase_price"
    t.integer "rental_price"
    t.integer "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gear_bags", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.integer "bike_id"
    t.integer "helmet_id"
    t.integer "pads_id"
    t.integer "gloves_id"
    t.integer "goggles_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lift_passes", force: :cascade do |t|
    t.string "pass_type", default: "Day"
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.integer "price"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "lodging_name"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "rented", default: false, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.integer "user_id"
    t.boolean "rent_eq"
    t.integer "lodging_id"
    t.integer "lift_pass_id"
    t.integer "total_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gear_bag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "username"
    t.text "password_digest"
    t.text "password_confirmation"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
