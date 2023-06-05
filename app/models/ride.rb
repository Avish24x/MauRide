class Ride < ApplicationRecord
  validates :start_location, :end_location, :price, presence: true
end
