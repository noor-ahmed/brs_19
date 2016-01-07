class ReviewsController < ApplicationController
  before_action :load_details, only: [:show, :edit]

  def show
    @comment = current_user.comments.build
    @comments = @review.comments.all.from_last
  end

  def create
    if @review.save
      flash[:success] = t ".success"
    else
      flash[:alert] = t ".failed"
    end
    @review.create_activity key: "Review.create", owner: current_user
    redirect_to book_path id: @review.book_id
  end

  def edit
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = t ".update_success"
      redirect_to book_path @review.book_id
    else
      render "edit"
    end
  end

  def destroy
    @review.destroy
    flash[:success] = t ".delete_success"
    redirect_to book_path params[:book_id]
  end

  private
  def review_params
    params.require(:review).permit :content, :rating, :book_id, :user_id
  end
  def load_details
    @book = @review.book
    @book_images = @book.book_images
    @reviews = @book.reviews.page(params[:page]).per 10
    @users_book = UsersBook.find_by_user_id_and_book_id(current_user, @book) ||
      UsersBook.new
  end
end
