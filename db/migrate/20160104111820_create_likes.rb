class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :type
      t.references :user, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
