class User < ActiveRecord::Base
  has_many :users_books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :books, through: :users_books
  has_many :active_relationships, class_name:  Relationship.name,
                                  foreign_key: :follower_id,
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name:  Relationship.name,
                                   foreign_key: :followed_id,
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  enum role: [:user, :admin]
end
