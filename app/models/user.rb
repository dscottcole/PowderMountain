class User < ApplicationRecord
    has_many :reservations
    has_many :equipments, through: :reservations
    has_many :lodgings, through: :reservations
    has_many :lift_passes

    has_secure_password

    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :password, length: {in:6..20}
end
