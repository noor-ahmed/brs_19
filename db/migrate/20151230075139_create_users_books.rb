class CreateUsersBooks < ActiveRecord::Migration
  def change
    create_table :users_books do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.integer :status
      t.boolean :favorite

      t.timestamps null: false
    end
  end
end
