class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @review = Review.new
    @reviews = @user&.vehicules&.map(&:rides)&.first&.map(&:reviews)&.first unless @user.vehicules.empty? && @user.vehicules.map(&:rides)[0]
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
