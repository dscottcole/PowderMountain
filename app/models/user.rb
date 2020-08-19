class User < ApplicationRecord
    has_many :reservations
    has_many :gear_bags, through: :reservations
    has_many :lodgings, through: :reservations
    has_many :lift_passes

    has_secure_password

    validates :email, uniqueness: true, on: :create
    validates :username, uniqueness: true, on: :create
    validates :password, length: {in:6..20}
end
