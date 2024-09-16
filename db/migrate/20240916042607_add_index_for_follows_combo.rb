class AddIndexForFollowsCombo < ActiveRecord::Migration[7.2]
  def change
    add_index :follows, [ :follower_id, :following_id ], unique: true
  end
end
