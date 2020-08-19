class Circle < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :user_circles, dependent: :destroy
  has_many :users, through: :user_circles
  has_one :leader_circle_user, -> {where(leader: true)}, class_name: "UserCircle"
  has_one :leader_user, through: :leader_circle_user, source: :user
  belongs_to_active_hash :genre
  belongs_to_active_hash :activity
  belongs_to_active_hash :age_range
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name
    validates	:description, length: { maximum: 1000 }
    validates :genre_id, numericality: { other_than: 1 }
    validates :activity_id, numericality: { other_than: 1 }
    validates :age_range_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  private

  def should_not_destroy
    return throw :abort unless leader_user == current_user
  end
end
