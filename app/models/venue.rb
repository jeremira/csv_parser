class Venue < ApplicationRecord
  belongs_to :spectacle
  has_many :bookings
end
