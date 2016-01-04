class Admin::BooksController < ApplicationController

  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t :books_new_success_message
      redirect_to [:admin, @book]
    else
      flash[:danger] = t :books_new_failure_message
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :publish_date,
      :num_of_pages, :category_id)
  end
end