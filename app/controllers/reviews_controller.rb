class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @plant = Plant.find(params[:plant_id])
    @review = @plant.reviews.build(review_params.merge(user: current_user))
    if @review.save
      redirect_to @plant, notice: 'Review added successfully.'
    else
      redirect_to @plant, alert: 'Could not add the review.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
