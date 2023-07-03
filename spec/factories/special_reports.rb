FactoryBot.define do
  factory :special_report do
    location_id { 1 }
    category_id { 1 }
    point { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }
    association :user
  
    after(:build) do |special_report|
      special_report.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
