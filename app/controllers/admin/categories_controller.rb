class Admin::CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create    
    if @category.save
      flash[:success] = t ".success"
      redirect_to admin_category_path @category
    else
      render :new
    end
  end

  def edit    
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to admin_category_path @category
    else
      render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit :id, :name, :image
  end
end