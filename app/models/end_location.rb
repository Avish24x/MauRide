class EndLocation < ApplicationRecord
  belongs_to :ride

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, presence: true

end
