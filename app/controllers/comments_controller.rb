class CommentsController < ApplicationController
  def index
    @comment_activities = Comment.activities
  end

  def create
    @comment.user = current_user
    @comment.save
    @comment.create_activity key: "Comment.create", owner: current_user
    redirect_to :back
  end

  def edit
    @review = Review.find params[:review_id]
  end

  def update
    review = Review.find params[:review_id]
    if @comment.update_attributes comment_params
      flash[:success]= t "comments.comment_updated"
    end
    redirect_to book_review_path review.book, review
  end

  def destroy
    review = @comment.review
    @comment.destroy
    redirect_to book_review_path review.book, review
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end