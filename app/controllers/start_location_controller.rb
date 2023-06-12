class StartLocationsController < ApplicationController
  before_action :set_start_location, only: [:show, :edit, :update, :destroy]

  def create
    @start_location = StartLocation.new(start_location_params)

    if @start_location.save
      redirect_to @start_location, notice: 'Start Location was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @start_location.update(start_location_params)
      redirect_to @start_location, notice: 'Start Location was successfully updated.'
    else
      render :edit
    end
  end

  # def destroy
  #   @start_location.destroy
  #   redirect_to start_locations_url, notice: 'Start Location was successfully destroyed.'
  # end

  private

  def set_start_location
    @start_location = StartLocation.find(params[:id])
  end

  def start_location_params
    params.require(:start_location).permit(:ride_id, :latitude, :longitude)
  end
end
