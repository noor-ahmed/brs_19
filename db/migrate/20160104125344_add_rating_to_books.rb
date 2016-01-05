class AddRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :rating, :float, default: 0
  end
end