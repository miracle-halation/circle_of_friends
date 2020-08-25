class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :circle

  with_options presence: true do
    validates :title
    validates :body
    validates :start_time
    validates :end_time
  end
end
