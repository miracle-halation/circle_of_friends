class Circle < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :user_circles, dependent: :destroy
  has_many :users, through: :user_circles
  has_many :articles
  has_many :events
  has_one :leader_circle_user, -> { where(leader: true) }, class_name: 'UserCircle'
  has_one :leader_user, through: :leader_circle_user, source: :user
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name
    validates :phrase
    validates	:description, length: { maximum: 1000 }
    validates :genre_id, numericality: { other_than: 1 }
    validates :activity
    validates :age_range
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
  end


  def invite(other_users)
    users << other_users
  end

  def withdrawal(other_user)
    users.delete(other_user)
  end

  private

  def should_not_destroy
    return throw :abort unless leader_user == current_user
  end
end
