class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  # after_create :send_welcome_email

  has_one_attached :avatar

  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :followings_rel, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :followings_rel, dependent: :destroy

  has_many :followers_rel, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :followers_rel, dependent: :destroy

  validates :username, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9_.-]{3,16}\z/, message: "must be of length 3 - 16 characters. Only special characters '-', '_', '.' allowed." }

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    unless user
      user = User.create(
        username: data["email"].split("@")[0],
        email: data["email"],
        password: Devise.friendly_token[0, 20],
        omniauthed: true
      )
      user.attach_avatar(data["image"])
    end
    user
  end

  def attach_avatar(avatar_url)
      avatar_type = "image/png"
      avatar = URI.parse(avatar_url).open
      avatar_name = File.basename(avatar_url)

      self.avatar.attach(io: avatar, filename: avatar_name, content_type: avatar_type)
  end

  private

  # def send_welcome_email
  #   UserMailer.with(user: self).welcome_email.deliver_now
  # end
end
