class Book < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}
  belongs_to :category
  has_many :users_books, dependent: :destroy
  has_many :users, through: :users_books
  has_many :book_images, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates_presence_of [:title, :author, :publish_date, :num_of_pages, 
    :category, :book_images]
  validates :num_of_pages,  numericality: {only_integer: true, greater_than: 10}

  accepts_nested_attributes_for :book_images, allow_destroy: true
  validates_associated :book_images
  scope :favourited_by, ->(user) {
    joins(users_books: :user).where(users: {id: user.id}, users_books: 
      {favorite: true})
  }
end