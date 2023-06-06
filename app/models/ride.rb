class Ride < ApplicationRecord
  has_many :reviews

  validates :start_location, :end_location, :price, presence: true
end
