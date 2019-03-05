class Picture < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :favorites
	validate :image_size

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	private
	# 独自のバリデーションを定義 / アップロードされた画像サイズを制限
	def image_size
		if image.size > 5.megabytes
			errors.add(:image, "should be less than 5MB")
		end
	end
end
