class User < ApplicationRecord
    has_many :reservations
    has_many :equipments, through: :reservations
    has_many :lodgings, through: :reservations
    has_many :lift_passes

    has_secure_password
end
