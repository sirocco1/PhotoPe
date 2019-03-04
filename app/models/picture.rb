class Picture < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader
	validate :image_size

	private
	# 独自のバリデーションを定義 / アップロードされた画像サイズを制限
	def image_size
		if image.size > 5.megabytes
			errors.add(:image, "should be less than 5MB")
		end
	end
end
