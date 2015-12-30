class Book < ActiveRecord::Base
  belongs_to :category
  has_many :book_images, dependent: :destroy
  has_many :users_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :users_books
end
