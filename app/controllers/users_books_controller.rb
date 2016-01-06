class UsersBooksController < ApplicationController
  def update
    if users_book_params.has_key? :update_reading_status
      UsersBookService.new(current_user.id, params[:book_id]).update_reading_status
    elsif users_book_params.has_key? :mark_favorite
      UsersBookService.new(current_user.id, params[:book_id]).mark_favorite
    end
    redirect_to :back
  end

  private
  def users_book_params
    params.require(:users_book).permit :id, :update_reading_status, :mark_favorite
  end
end