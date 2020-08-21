FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new('public/images/test_image.jpg') }
    association :user
    association :circle
  end
end
