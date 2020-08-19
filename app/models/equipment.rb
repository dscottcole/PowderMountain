class Equipment < ApplicationRecord

    def self.bikes
        self.all.find_all {|e| e.equipment_type == "Bike" && e.stock > 0}
    end

    def self.helmets
        self.all.find_all {|e| e.equipment_type == "Helmet" && e.stock > 0}
    end
    
    def self.pads
        self.all.find_all {|e| e.equipment_type == "Pads" && e.stock > 0}
    end

    def self.gloves
        self.all.find_all {|e| e.equipment_type == "Gloves" && e.stock > 0}
    end

    def self.goggles
        self.all.find_all {|e| e.equipment_type == "Goggles" && e.stock > 0}
    end

end
