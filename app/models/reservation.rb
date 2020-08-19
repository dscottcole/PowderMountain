class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :lift_pass
    belongs_to :lodging, optional: true    
    belongs_to :gear_bag, optional: true
end
