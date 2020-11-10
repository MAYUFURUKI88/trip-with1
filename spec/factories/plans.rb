FactoryBot.define do
  factory :plan do
    title { Faker::Lorem.sentence }
    trip_id { 2 }
    price { Faker::Number.between(from: 0, to: 9_999_999) }
    capacity_id { 2 }
    first_day { '2020-11-10' }
    final_day { '2020-11-20' }
    deadline { '2020-11-05' }
    message { Faker::Lorem.sentence }
    association :user

    after(:build) do |plan|
      plan.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
