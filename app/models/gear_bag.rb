class GearBag < ApplicationRecord
    has_one :reservation

    validate :end_after_start
    validate :on_or_after_today
    validates :start_date, :end_date, :presence => true

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
