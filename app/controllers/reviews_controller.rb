class ReviewsController < ApplicationController
  def index
    @activities = Review.review_acitvities
  end

  def create
    if @review.save
      flash[:success] = t ".success"
    else
      flash[:alert] = t ".failed"
    end
    redirect_to book_path @review.book_id
  end

  def destroy
    @review.destroy
    flash[:success] = t ".delete_success"
    redirect_to :back
  end

  private
  def review_params
    params.require(:review).permit :content, :rating, :book_id, :user_id
  end
end
