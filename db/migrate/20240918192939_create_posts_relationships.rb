class CreatePostsRelationships < ActiveRecord::Migration[7.2]
  def change
    create_table :posts_relationships do |t|
      t.references :original, null: false, foreign_key: { to_table: :posts }
      t.references :comment, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
