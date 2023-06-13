class VehiculesController < ApplicationController
  before_action :set_vehicule, only: [:show]

  def index
    @vehicules = Vehicule.where(user: current_user)
  end

  def show; end

  def new
    @vehicule = Vehicule.new
    @vehicules = Vehicule.where(user: current_user)
  end

  def create
    @vehicule = Vehicule.new(vehicule_params)
    @vehicule.user = current_user
    if @vehicule.save
      # redirect_to vehicules_path(@vehicule)
      redirect_to new_ride_path(@vehicule)

    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicule = Vehicule.find(params[:id])
    @vehicule.destroy
    redirect_to vehicules_path, status: :see_other
  end

  private

  def vehicule_params
    params.require(:vehicule).permit(:model, :registration_detail)
  end

  def set_vehicule
    @vehicule = Vehicule.find(params[:id])
  end
end
