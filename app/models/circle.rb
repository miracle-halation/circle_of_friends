class Circle < ApplicationRecord
  has_many :user_circles
  has_many :users, through: :user_circles

  with_options presence: true do
    validates :name
    validates	:description, length: { maximum: 1000 }
    validates :genre_id, numericality: { other_than: 1 }
    validates :activity_id, numericality: { other_than: 1 }
    validates :age_range_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :leader
  end
end
