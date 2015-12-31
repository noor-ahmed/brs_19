class Book < ActiveRecord::Base
  belongs_to :category
  has_many :users_books, dependent: :destroy
  has_many :users, through: :users_books
  has_many :book_images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :book_images, allow_destroy: true,
    reject_if: proc {|attributes| attributes["image"].blank?}
end
