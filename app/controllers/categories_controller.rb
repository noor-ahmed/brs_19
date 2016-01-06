class CategoriesController < ApplicationController
  def index
  end

  def show
    @books = @category.books
  end
end