class Ride < ApplicationRecord
  has_many :bookings
  validates :start_location, :end_location, :price, presence: true
end
