class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_one :author_circle_user, -> { where(author: true) }, class_name: 'UserEvent'
  has_one :author_user, through: :author_circle_user, source: :user
  belongs_to :circle

  with_options presence: true do
    validates :title
    validates :body
    validates :start_time
    validates :end_time
  end

  def attendance(other_user)
    users << other_user
  end

  def absence(other_user)
    users.delete(other_user)
  end
end
