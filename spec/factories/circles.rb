FactoryBot.define do
  factory :circle do
    name              {Faker::Name.initials(number: 4)}
    description       {Faker::Lorem.sentence}
    genre_id          { 2 }
    activity_id       { 2 }
    age_range_id      { 2 }
    prefecture_id     { 2 }
    leader            { 1 }
  end
end
