class Vehicule < ApplicationRecord
  belongs_to :ride
  has_many :users

  validates :model, :seats, presence: true
end
