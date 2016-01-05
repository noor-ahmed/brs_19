class BooksController < ApplicationController
  def index
    @categories = Category.all
    @search = Book.search params[:q]
    @books = @search.result
  end

  def show
    @reviews = @book.reviews
  end
end