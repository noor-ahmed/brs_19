class UsersController < ApplicationController
  def index
  end

  def show
    @favourited_books = Book.favourited_by @user
    @activities = User.activities @user
  end

  def edit
  end

  def update
    if current_user.update_attributes user_params
      redirect_to user_path current_user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :image, :image_cache, :remote_image_url, 
      :_destroy
  end
end
