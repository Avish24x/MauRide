class Review < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :comment, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
