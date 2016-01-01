class UsersController < ApplicationController
  def index
  end

  def show
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
    params.require(:user).permit :image
  end  
end