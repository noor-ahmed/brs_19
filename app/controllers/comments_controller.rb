class CommentsController < ApplicationController
  def index
    @comment_activities = Comment.activities
  end
end