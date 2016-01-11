class Admin::BooksController < ApplicationController
  def index
    @categories = Category.all
    @search = Book.search params[:q]
    @books = @search.result
  end

  def show
    @book_images = @book.book_images
    @reviews = @book.reviews.page(params[:page]).per 10
    @review = Review.new
  end

  def new
    @book = Book.new
  end

  def create
    if @book.save
      flash[:success] = t ".success"
      redirect_to [:admin, @book]
    else
      flash[:danger] = t ".danger"
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t ".success"
      redirect_to admin_book_path @book
    else
      flash[:danger] = t ".danger"
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:warning] = t ".warning"
    redirect_to admin_books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :publish_date, :num_of_pages, 
      :category_id, book_images_attributes: [:id, :image, :image_cache, 
      :remote_image_url, :_destroy])
  end
end