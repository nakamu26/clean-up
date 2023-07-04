FactoryBot.define do
  factory :illegal_report do
    location_id { 1 }
    point { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }
    association :user
  
    after(:build) do |illegal_report|
      illegal_report.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
