class BooksController < ApplicationController
  def index
  end

  def show
    @reviews = @book.reviews
  end
end