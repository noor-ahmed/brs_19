class BookImage < ActiveRecord::Base
  belongs_to :book

  mount_uploader :image, ImageUploader
  validates_presence_of [:image]
  validates :image, file_size: {less_than: 3.megabytes},
    file_content_type: {allow: ["image/jpeg", "image/jpg", "image/png"]}
end
