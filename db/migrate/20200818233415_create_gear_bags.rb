class CreateGearBags < ActiveRecord::Migration[6.0]
  def change
    create_table :gear_bags do |t|
        t.date :start_date
        t.date :end_date
        t.integer :duration
        t.integer :bike_id
        t.integer :helmet_id
        t.integer :pads_id
        t.integer :gloves_id
        t.integer :goggles_id

      t.timestamps
    end
  end
end
