class Article < ApplicationRecord
	belongs_to :user
	belongs_to :circle
	has_rich_text :content
	has_one_attached :image

	validates :title, presence: true
end
