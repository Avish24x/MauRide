class ReviewsController < ApplicationController
  before_action :set_ride, only: [:create]

  def create
    @user = User.find(params[:id])
    @review = Review.new(review_params)
    @review.ride = @ride
    @review.user = current_user
    @review.ride = @ride
    @review.timestamp = Time.now
    if @review.save
      redirect_to user_path(@user)
    else
      render "rides/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to ride_path(@review.ride), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_ride
    @ride = Ride.find(params[:ride_id])
  end
end
