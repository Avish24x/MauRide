class UsersController < ApplicationController



  before_action :set_user, only: [:show, :index]

  def show
    @review = Review.new
    @reviews = @user&.vehicules&.map(&:rides)&.first&.map(&:bookings)&.first&.map(&:reviews)&.pop unless @user&.vehicules&.empty?
    @vehicules = Vehicule.all
  end

  private

  def set_user
    @user = User.find(params[:id])

  end
end
