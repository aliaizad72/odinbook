class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :posts_relationships

  has_many :original_posts, foreign_key: :comment_id, class_name: "PostsRelationship"
  has_many :originals, through: :original_posts

  has_many :posts_comments, foreign_key: :original_id, class_name: "PostsRelationship"
  has_many :comments, through: :posts_comments

  validates :body, presence: true, length: { maximum: 140 }

  scope :order_recent, -> { order(created_at: :desc) }
  scope :all_posts, -> { all.order_recent }
  scope :user_posts, ->(id) { where(user_id: id).order_recent }

  def original
    originals[0]
  end
end
