class Lodging < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations

    def self.av_camp
        self.all.find_all {|l| l.lodging_name.include?("Camp") && l.rented == false}
    end

    def self.av_cabin
        self.all.find_all {|l| l.lodging_name.include?("Cabin") && l.rented == false}
    end

    def self.uv_camp
        self.all.find_all {|l| l.lodging_name.include?("Camp") && l.rented == true}
    end

    def self.uv_cabin
        self.all.find_all {|l| l.lodging_name.include?("Cabin") && l.rented == true}
    end

    def self.av_lodging
        self.all.find_all {|l| l.rented == false}
    end

    def rent
        self.rented = true
        self.save
    end

    def check_out
        self.rented = false
        self.save
    end
end
