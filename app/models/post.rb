class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { maximum: 140 }

  scope :all_posts, -> { all.order(created_at: :desc) }
end
