class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  has_many :followings_rel, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :followings_rel

  has_many :followers_rel, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :followers_rel

  validates :username, presence: true, uniqueness: true
end
