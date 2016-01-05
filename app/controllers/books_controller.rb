class BooksController < ApplicationController
  def index
    @categories = Category.all
    @search = Book.search params[:q]
    @books = @search.result
  end

  def show
    @book_images = @book.book_images
    @reviews = @book.reviews.page(params[:page]).per 10
  end
end