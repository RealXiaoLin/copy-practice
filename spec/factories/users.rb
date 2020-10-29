FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname {Faker::Name.initials(number: 2)}
    first_name {"太郎"}
    last_name {"山田"}
    kana_first_name {"タロウ"}
    kana_last_name {"ヤマダ"}
    birthday {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}

  end
end
