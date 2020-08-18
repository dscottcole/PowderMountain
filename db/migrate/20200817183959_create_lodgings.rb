class CreateLodgings < ActiveRecord::Migration[6.0]
  def change
    create_table :lodgings do |t|
      t.string :lodge_type
      t.integer :number
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
