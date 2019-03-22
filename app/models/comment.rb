class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :picture
	validates :content, length: {maximum: 100}
end
