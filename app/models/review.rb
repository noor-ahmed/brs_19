class Review < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy

  class << self
    def review_acitvities
      PublicActivity::Activity.order("created_at desc").
        where(trackable_type: "Review")
    end
  end
end
