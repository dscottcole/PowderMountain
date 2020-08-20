class CreateLodgings < ActiveRecord::Migration[6.0]
  def change
    create_table :lodgings do |t|
      t.string :lodging_name
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
