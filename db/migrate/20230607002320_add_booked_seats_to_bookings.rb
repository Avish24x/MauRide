class AddBookedSeatsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booked_seats, :integer
  end
end
