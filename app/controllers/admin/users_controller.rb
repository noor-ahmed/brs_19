class Admin::UsersController < ApplicationController
  def index
  end

  def show
  end
  
  def destroy
    @user.destroy
    flash[:warning] = t ".warning"
    redirect_to admin_users_path
  end
end