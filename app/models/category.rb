class Category < ActiveRecord::Base
  mount_uploader :image, CategoryImageUploader
  has_many :books, dependent: :destroy
  validates_presence_of [:name, :image]
  validates :image, file_size: {less_than: 3.megabytes},
    file_content_type: {allow: ["image/jpeg", "image/png"]}
end