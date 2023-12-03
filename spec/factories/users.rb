FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    user_name { Faker::Internet.user_name }
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }
    last_name_frigana { Faker::Japanese::Name.last_name.yomi }
    first_name_frigana { Faker::Japanese::Name.first_name.yomi }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }

    # パスワード関連の設定
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

  end
end
