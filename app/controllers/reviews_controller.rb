class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @user = @booking.ride.vehicule.user
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
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
    redirect_to bookings_path(), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
