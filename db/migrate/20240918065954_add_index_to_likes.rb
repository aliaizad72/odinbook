class AddIndexToLikes < ActiveRecord::Migration[7.2]
  def change
    add_index :likes, [ :post_id, :user_id ], unique: true
  end
end
