class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
    @review = Review.new
  end

  def set_user
    @user = User.find(params[:id])
  end
end
