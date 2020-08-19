class LiftPass < ApplicationRecord
    belongs_to :user
    delegate :reservations, :to => :user
end
