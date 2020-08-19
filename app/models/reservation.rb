class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :lodging
    belongs_to :lift_pass
    belongs_to :gear_bag
end
