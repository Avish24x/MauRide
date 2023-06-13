class AddBookingStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_status, :boolean, default: nil
  end
end
