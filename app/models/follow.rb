class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

  validates :follower_id, comparison: { other_than: :following_id }
  validates :following_id, comparison: { other_than: :follower_id }
end
