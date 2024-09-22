class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_one_attached :avatar

  has_many :posts, dependent: :destroy

  has_many :comments

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :followings_rel, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :followings_rel, dependent: :destroy

  has_many :followers_rel, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :followers_rel, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 15 }
end
