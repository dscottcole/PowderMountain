class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.integer :user_id
      t.integer :equipment_id
      t.boolean :rent_eq
      t.integer :lodging_id
      t.integer :lift_pass_id
      t.integer :total_cost

      t.timestamps
    end
  end
end
