class Ride < ApplicationRecord
  belongs_to :vehicule
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_one :start_location, dependent: :destroy
  has_one :end_location, dependent: :destroy
  # geocoded_by :address
  # after_validation :geocode
  validates :start_location, :end_location, :price, presence: true

end
