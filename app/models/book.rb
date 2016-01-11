class Book < ActiveRecord::Base
  belongs_to :category
  has_many :users_books, dependent: :destroy
  has_many :users, through: :users_books
  has_many :book_images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates_presence_of [:title, :author, :publish_date, :num_of_pages,
    :category, :book_images]
  validates :num_of_pages,  numericality: {only_integer: true, greater_than: 10}
  validates_associated :book_images

  accepts_nested_attributes_for :book_images, allow_destroy: true

  scope :favourited_by, ->(user_id) {
    joins(users_books: :user).where(users: {id: user_id}, users_books:
    {favorite: true})
  }

  scope :favorite_searching, ->(criteria) do
    search = criteria.split
    case search[0]
      when "all"
        Book.all
      else
        favourited_by search[1].to_i
    end
  end

  private
  class << self
    def ransackable_scopes auth_object = nil
      [:favorite_searching]
    end
  end
end



