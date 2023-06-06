class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy update]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end


  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :ride_id, :seats)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
