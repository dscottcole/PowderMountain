class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :lift_pass
    belongs_to :lodging, optional: true    
    belongs_to :gear_bag, optional: true

    validate :end_after_start
    validate :on_or_after_today

    def calculate_cost
        lift_pass_cost = self.lift_pass.price * self.lift_pass.duration

        equipment_cost = 0
        if rent_eq == true 
            eq_hash = { bike: Equipment.find_by(id: self.gear_bag.bike_id), helmet: Equipment.find_by(id: self.gear_bag.helmet_id), pads: Equipment.find_by(id: self.gear_bag.pads_id), gloves: Equipment.find_by(id: self.gear_bag.gloves_id), goggles: Equipment.find_by(id: self.gear_bag.goggles_id)}
            equipment_cost = eq_hash.values.map {|e| e.rental_price}.sum * self.gear_bag.duration
        end

        lodging_cost = 0
        if self.lodging != nil
        lodging_cost = self.lodging.price * self.duration
        end
        
        total_cost = lift_pass_cost + equipment_cost + lodging_cost
    end

    def lp_cost
        lift_pass_cost = self.lift_pass.price * self.lift_pass.duration
    end

    def rental_cost
        equipment_cost = 0
        if rent_eq == true 
            eq_hash = { bike: Equipment.find_by(id: self.gear_bag.bike_id), helmet: Equipment.find_by(id: self.gear_bag.helmet_id), pads: Equipment.find_by(id: self.gear_bag.pads_id), gloves: Equipment.find_by(id: self.gear_bag.gloves_id), goggles: Equipment.find_by(id: self.gear_bag.goggles_id)}
            equipment_cost = eq_hash.values.map {|e| e.rental_price}.sum * self.gear_bag.duration
        end
    end

    def rental_eq
        
        if rent_eq == true 
            @eq_hash = { bike: Equipment.find_by(id: self.gear_bag.bike_id), helmet: Equipment.find_by(id: self.gear_bag.helmet_id), pads: Equipment.find_by(id: self.gear_bag.pads_id), gloves: Equipment.find_by(id: self.gear_bag.gloves_id), goggles: Equipment.find_by(id: self.gear_bag.goggles_id)}
        else 
            @eq_hash = {}
        end
    end

    def lodging_cost
        lodging_cost = 0
        if self.lodging != nil
        lodging_cost = self.lodging.price * self.duration
        end
    end


private
    
    def end_after_start
        return if end_date.blank? || start_date.blank?
 
        if end_date <= start_date
        errors.add(:end_date, "must be after the start date") 
        end 
    end

    def on_or_after_today
        return if end_date.blank? || start_date.blank?
 
        if Date.today > start_date && Date.today > start_date
        errors.add(:date_range, "today is the earliest possible date") 
        end 
    end


end
