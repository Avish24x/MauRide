class EndLocationsController < ApplicationController
  before_action :set_end_location, only: [:show, :edit, :update, :destroy]

  def create
    @end_location = EndLocation.new(end_location_params)

    if @end_location.save
      redirect_to @end_location, notice: 'End Location was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @end_location.update(end_location_params)
      redirect_to @end_location, notice: 'End Location was successfully updated.'
    else
      render :edit
    end
  end

  # def destroy
  #   @end_location.destroy
  #   redirect_to end_locations_url, notice: 'End Location was successfully destroyed.'
  # end

  private

  def set_end_location
    @end_location = EndLocation.find(params[:id])
  end

  def end_location_params
    params.require(:end_location).permit(:ride_id, :latitude, :longitude)
  end
end
