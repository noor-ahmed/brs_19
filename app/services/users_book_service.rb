class UsersBookService
  def initialize user_id, book_id
    @user = User.find user_id
    @users_book = UsersBook.find_by_user_id_and_book_id(@user, book_id) ||
      UsersBook.new(user_id: user_id, book_id: book_id)
  end

  def update_reading_status
    if @users_book.new_record? || @users_book.unread?
      @users_book.reading!
      @users_book.create_activity key: "UsersBook.reading", owner: @user
    else
      @users_book.read!
      @users_book.create_activity key: "UsersBook.read", owner: @user
    end
  end

  def mark_favorite
    @users_book.favorite = true
    @users_book.save
    @users_book.create_activity key: "UsersBook.favorite", owner: @user
  end
end