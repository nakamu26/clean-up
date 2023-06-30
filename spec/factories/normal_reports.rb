FactoryBot.define do
  factory :normal_report do
    location_id { 1 }
    number_of_times_id { 1 }
    point { Faker::Lorem.sentence }
    association :user
  
    after(:build) do |normal_report|
      normal_report.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
