FactoryBot.define do
  factory :user_circle do
    association :user
    association :circle
    leader { false }
  end
end
