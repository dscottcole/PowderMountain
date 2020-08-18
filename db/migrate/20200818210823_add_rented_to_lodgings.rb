class AddRentedToLodgings < ActiveRecord::Migration[6.0]
  def change
    add_column :lodgings, :rented, :boolean, null: false, default: false
  end
end
