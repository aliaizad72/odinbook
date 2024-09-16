class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { maximum: 140 }

  scope :order_recent, -> { order(created_at: :desc) }
  scope :all_posts, -> { all.order_recent }
  scope :user_posts, ->(id) { where(user_id: id).order_recent }
end
