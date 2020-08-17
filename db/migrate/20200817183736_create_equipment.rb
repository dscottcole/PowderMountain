class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :sport
      t.string :equipment_type
      t.string :eq_name
      t.string :size
      t.integer :purchase_price
      t.integer :rental_price
      t.integer :stock

      t.timestamps
    end
  end
end
