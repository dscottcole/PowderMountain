class AddUserIdToGearBags < ActiveRecord::Migration[6.0]
  def change
    add_column :gear_bags, :user_id, :integer
  end
end
