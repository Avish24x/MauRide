class Ride < ApplicationRecord
  belongs_to :vehicule
  has_many :bookings
  has_many :reviews, dependent: :destroy


  validates :start_location, :end_location, :price, presence: true

end
