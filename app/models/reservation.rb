class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :equipment
    belongs_to :lodging
    belongs_to :lift_pass
end
