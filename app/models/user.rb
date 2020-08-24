class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  has_many :user_circles
  has_many :circles, through: :user_circles
  has_many :articles
  has_many :user_events
	has_many :events, through: :user_events
  has_one_attached :avatar
end
