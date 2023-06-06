class Vehicule < ApplicationRecord
  belongs_to :user
  has_many :rides

  validates :model, :capacity, presence: true
end
