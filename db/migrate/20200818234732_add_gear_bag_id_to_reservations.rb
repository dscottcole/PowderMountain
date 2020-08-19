class AddGearBagIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :gear_bag_id, :integer
    remove_column :reservations, :equipment_id, :integer
  end
end
