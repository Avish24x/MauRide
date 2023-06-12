class StartLocation < ApplicationRecord
  belongs_to :ride

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  # validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :address, presence: true



end
