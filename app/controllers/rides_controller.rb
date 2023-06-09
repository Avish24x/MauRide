class RidesController < ApplicationController
  before_action :set_ride, only: [:show]

  def index
    @rides = Ride.all
  end

  def show
    @review = Review.new
    @booking = Booking.new
    @vehicule = @ride.vehicule
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      redirect_to ride_path(@ride)
    else
      puts @ride.errors.full_messages # Add this line to see any error messages in the console
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    redirect_to rides_path, status: :see_other
  end

  private

  def ride_params
    params.require(:ride).permit(:start_location, :end_location, :ride_details, :start_time, :end_time, :price, :seats, :vehicule_id)
  end

  def set_ride
    @ride = Ride.find(params[:id])
  end
end
