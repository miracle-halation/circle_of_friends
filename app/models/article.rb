class Article < ApplicationRecord
	belongs_to :user
	belongs_to :circle

	validates :title
end
