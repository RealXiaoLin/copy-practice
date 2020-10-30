FactoryBot.define do
  factory :item do
    title { Faker::Lorem.words(number: 4) }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    shipping_location_id { Faker::Number.between(from: 2, to: 48) }
    shipment_date_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.number(digits: 7) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/flag.png'), filename: 'test_image.png')
    end
  end
end
