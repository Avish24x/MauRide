class RidesController < ApplicationController
  before_action :set_ride, only: %i[show destroy update]

  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    # @ride.user = current_user
    if @ride.save
      redirect_to ride_path(@ride)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
  end

  def destroy
    @ride.destroy
    redirect_to rides_path, status: :see_other
  end

  private

  def ride_params
    params.require(:ride).permit(:start_location, :end_location, :ride_details, :distance, :start_time, :end_time, :price)
  end

  def set_ride
    @ride = Ride.find(params[:id])
  end
end
