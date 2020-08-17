class CreateLiftPasses < ActiveRecord::Migration[6.0]
  def change
    create_table :lift_passes do |t|
      t.string :pass_type
      t.integer :duration
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
