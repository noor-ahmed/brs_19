class BooksController < ApplicationController
  def index
  end

  def show
    @book_images = @book.book_images
    @reviews = @book.reviews.page(params[:page]).per 10
  end
end