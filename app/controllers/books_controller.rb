class BooksController < ApplicationController
  def index
    @categories = Category.all
    @search = Book.search params[:q]
    @books = @search.result
  end

  def show
    @book_images = @book.book_images
    @reviews = @book.reviews.page(params[:page]).per 10
    @review = Review.new
    @users_book = UsersBook.find_by_user_id_and_book_id(current_user, @book) || 
      UsersBook.new
  end
end