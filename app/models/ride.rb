class Ride < ApplicationRecord
  has_many :bookings
  has_many :reviews, dependent: :destroy
  belongs_to :vehicule

  validates :start_location, :end_location, :price, presence: true
end
