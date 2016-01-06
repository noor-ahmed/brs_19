class Review < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy
  validates_presence_of :content

  after_save :update_book_rating
  after_destroy :update_book_rating

  class << self
    def review_acitvities
      PublicActivity::Activity.order("created_at desc").
        where(trackable_type: "Review")
    end
  end

  private
  def update_book_rating
    book.rating = book.reviews.average "rating"
    book.save
  end
end
