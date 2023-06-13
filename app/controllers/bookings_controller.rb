class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
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
    redirect_to bookings_path(@booking)
  end

  def show
  end

  def driver_bookings
    @rides = current_user.vehicules.map(&:rides)
  end

  def update
    if @booking.update_attributes(booking_params)
      flash[:success] = "booking updated"
      redirect_to @booking
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :ride_id, :booked_seats, :booking_status)
  end

  def approve
    if @booking_status.nil?
      return 'booking pending'
    elsif @booking_status == true
      flash[:success] = "Booking successfully approved"
      return 'booking approved'
    else
      flash[:error] = "Booking not approved"
      return 'booking decline'
    end
  end
end
