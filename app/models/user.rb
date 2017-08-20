class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TODO: mail認証をする時にconfirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :location
  validates :nickname, presence: true
  validates :age, presence: true
  validates :location, presence: true
  validates :sexuality, presence: true
  after_validation :geocode
  has_many :direct_messages
  has_many :likes, dependent: :destroy
  enum sexuality: %w(lesbian gay bisexual mtof ftom etc)

  def like_user(user_id)
    !!Like.find_by(user_id: user_id)
  end

  class << self
    def get_recommended_users(user)
      near_users = User.near(user.location)
      near_users.order(likes_count: :desc).limit(3)
    end
  end
end
