class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar_image, AvatarImageUploader
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
  #フォロー/フォロワーの記述
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  validates :name, presence: true, length: {maximum: 20, minimum: 2}
  validates :introduce, length: {maximum: 300}
  def followed_by?(user)
  	passive_relationships.find_by(following_id: user.id).present?
  end
  #ここまで
end
