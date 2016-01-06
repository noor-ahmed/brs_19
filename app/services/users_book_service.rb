class UsersBookService
  def initialize user_id, book_id
    @users_book = UsersBook.find_by_user_id_and_book_id(user_id, book_id) || 
      UsersBook.new(user_id: user_id, book_id: book_id)
  end

  def update_reading_status
    if @users_book.new_record? || @users_book.unread?
      @users_book.reading!
    else
      @users_book.read!
    end
  end
end