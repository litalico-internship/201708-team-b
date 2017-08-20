class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TODO: mail認証をする時にconfirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nickname, presence: true
  validates :age, presence: true
  validates :location, presence: true
  validates :sexuality, presence: true

  has_many :direct_messages, foreign_key: :sender_id

  enum sexuality: %w(lesbian gay bisexual mtof ftom etc)

  has_many :likes, dependent: :destroy
  def like_user(user_id)
    !!Like.find_by(user_id: user_id)
  end
end
