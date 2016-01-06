class UsersBook < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
  belongs_to :book
  enum status: [:unread, :reading, :read]
  attr_accessor :update_reading_status
end