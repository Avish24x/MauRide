class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ride
  has_many :reviews
end
