FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password { "password123" }
    password_confirmation {password}
    family_name           { "山田" }
    personal_name         { "太郎" }
    family_name_kana      { "ヤマダ" }
    personal_name_kana    { "タロウ" }
    birthday              { "1990-01-01" }
  end
end