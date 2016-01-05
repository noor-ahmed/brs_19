class Admin::UsersController < ApplicationController
  def index
  end

  def show
    @favourited_books = Book.favourited_by @user
  end
  
  def destroy
    @user.destroy
    flash[:warning] = t ".warning"
    redirect_to admin_users_path
  end
end