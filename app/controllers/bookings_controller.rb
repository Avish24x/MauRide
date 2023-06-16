class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @ride = Ride.find_by_id(params[:ride_id])
    @review = Review.new
  end

  def new
    @booking = Booking.new
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.ride = @ride
    @booking.save
    @ride.seats -= booking_params[:booked_seats].to_i
    @ride.save
    # redirect_to bookings_path(@booking)
  end

  def show
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :ride_id, :booked_seats)
  end
end
