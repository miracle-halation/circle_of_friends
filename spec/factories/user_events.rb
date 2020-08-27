FactoryBot.define do
  factory :user_event do
    association :user
    association :event
    author  { false }
  end
end
