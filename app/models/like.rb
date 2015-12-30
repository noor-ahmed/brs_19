class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  enum state: [:like, :unlike]
end
