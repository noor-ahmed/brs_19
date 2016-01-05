class ReviewsController < ApplicationController
  def index
    @activities = Review.review_acitvities
  end
end
