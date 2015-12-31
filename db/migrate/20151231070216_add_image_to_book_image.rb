class AddImageToBookImage < ActiveRecord::Migration
  def change
    add_column :book_images, :image, :string
  end
end
