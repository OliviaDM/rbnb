class ReviewsController < ApplicationController
  before_action :authenticate_sucker!
  before_action :set_review

  def update
    @review.update(review_params)
    @review.save
    raise
    redirect_to beast_path(@review.booking.beast.id)
    authorize @review
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:sucker_content, :beast_content, :sucker_rating, :beast_rating, :booking_id)
  end
end
