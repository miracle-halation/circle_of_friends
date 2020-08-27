FactoryBot.define do
  factory :circle do
    name              { Faker::Name.initials(number: 4) }
    phrase            { Faker::Lorem.word }
    description       { Faker::Lorem.sentence }
    genre_id          { 2 }
    activity          { '毎週土日' }
    age_range         { '20代~30代' }
    prefecture_id     { 2 }
    city              { Faker::Address.city }
  end
end
