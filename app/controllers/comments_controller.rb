class CommentsController < ApplicationController
  def index
    @comment_activities = Comment.activities
  end

  def create
    @comment.user = current_user
    @comment.save
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
