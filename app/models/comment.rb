class Comment < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
  belongs_to :review
  validates :content, presence: true

  scope :from_last, ->{order updated_at: :desc}

  class << self
    def activities
      PublicActivity::Activity.order("created_at desc").
        where(trackable_type: "Comment")
    end
  end
end
