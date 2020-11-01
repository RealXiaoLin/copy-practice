FactoryBot.define do
  factory :order_address do
    zip_code { "111-1111"}
    region_id { Faker::Number.between(from: 2, to: 48) }
    city { "横浜市緑区" }
    building { "青山1-1-1" }
    house_number { "柳ビル3-10" }
    phone_number { "08011111111" }
    item_id { 1 }
    user_id { 1 }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
