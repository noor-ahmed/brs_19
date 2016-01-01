class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def create    
    if @category.save
      flash[:success] = t ".success"
      redirect_to @category
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :id, :name, :image
  end
end