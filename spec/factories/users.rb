FactoryBot.define do
  factory :user do
    user_name { "www123" }
    last_name { "佐藤" }
    first_name { "京子" }
    last_name_frigana { "サトウ" }
    first_name_frigana { "キョウコ" }
    birthday { "1995/12/4" }
    password { "www123" } # パスワードは必要に応じて変更してください
  end
end
