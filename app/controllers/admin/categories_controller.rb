class Admin::CategoriesController < ApplicationController
  def index
  end

  def show
    @books = @category.books
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

  def destroy
    @category.destroy
    flash[:warning] = t ".warning"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :id, :name, :image, :image_cache, 
      :remote_image_url, :_destroy
  end
end