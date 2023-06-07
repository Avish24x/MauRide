class Vehicule < ApplicationRecord
  has_many :rides
  belongs_to :user

  validates :model, presence: true
end
