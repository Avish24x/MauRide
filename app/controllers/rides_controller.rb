class RidesController < ApplicationController
  before_action :set_ride, only: [:show]

  def index
    @rides = Ride.all

  end

  def show
    @review = Review.new
    @booking = Booking.new
    @start_location = @ride.start_location
    @end_location = @ride.end_location

    @markers =[
      {
        position: 'start',
        lat: @start_location.latitude,
        lng: @start_location.longitude
      },
      {
        position: 'finish',
        lat: @end_location.latitude,
        lng: @end_location.longitude
      }
    ]

  end

  def new
    @ride = Ride.new
    @start_location = StartLocation.new
    @end_location = EndLocation.new
  end

  def create
    @ride = Ride.new(ride_params)

    @start_location = StartLocation.new(start_location_params)
    @end_location = EndLocation.new(end_location_params)

    if @ride.save && @start_location.save && @end_location.save
      @ride.start_location = @start_location
      @ride.end_location = @end_location

      redirect_to ride_path(@ride), notice: 'Ride was successfully created.'
    else
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
    params.require(:ride).permit(
      :address, :ride_details, :start_time, :end_time, :price, :seats, :vehicule_id,
      start_location_attributes: [:latitude, :longitude],
      end_location_attributes: [:latitude, :longitude]
    )
  end

  def start_location_params
    params.require(:start_location).permit(
      :latitude, :longitude
  )
  end

  def end_location_params
    params.require(:end_location).permit(
      :latitude, :longitude
    )

  end


  def set_ride
    @ride = Ride.find(params[:id])
  end
end
