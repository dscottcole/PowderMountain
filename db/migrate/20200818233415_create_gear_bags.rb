class CreateGearBags < ActiveRecord::Migration[6.0]
  def change
    create_table :gear_bags do |t|
        t.text :bikegear

      t.timestamps
    end
  end
end
