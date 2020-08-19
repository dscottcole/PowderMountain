class CreateLiftPasses < ActiveRecord::Migration[6.0]
  def change
    create_table :lift_passes do |t|
      t.string :pass_type, default: "Day"
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
