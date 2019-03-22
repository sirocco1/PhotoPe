class Picture < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :genre
	has_many :comments, dependent: :destroy
	has_many :favorites
	validate :image_size
	validates :description, length: {maximum: 300}
	validates :genre_id, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	private
	def image_size
		if image.size > 5.megabytes
			errors.add(:image, "should be less than 5MB")
		end
	end
end
