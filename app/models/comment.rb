class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}
  belongs_to :user
  belongs_to :review

  class << self
    def activities
      PublicActivity::Activity.order("created_at desc").
        where(trackable_type: "Comment")
    end
  end
end
