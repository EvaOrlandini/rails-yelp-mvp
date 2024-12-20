class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    review = Review.new(set_review)
    restaurant = Restaurant.find(params[:restaurant_id])
    review.restaurant = restaurant
    review.save
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private

  def set_review
    params.require(:review).permit(:content, :rating)
  end
end
