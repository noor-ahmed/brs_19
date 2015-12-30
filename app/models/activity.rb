class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  enum action: [:follow, :unfollow, :reading, :read, :favorite, :write_review, 
    :write_comment]
end
