class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ride
    # validates  :user_id, :ride_id, :payment_method, :payment_status
    def total_price
    end
end
