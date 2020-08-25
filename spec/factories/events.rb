FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence }
    body  { Faker::Lorem.sentence }
    start_time { 1.hour.ago }
    end_time { Time.now }
    association :circle
  end
end
