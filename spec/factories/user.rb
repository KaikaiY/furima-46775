FactoryBot.define do
  factory :user do
    transient do
      gimei_name { Gimei.name }
    end

    nick_name             { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.email }
    password              { 'A1Bc45QR6L' }
    password_confirmation { password }
    first_name_zenkaku    { [gimei_name.first.kanji, gimei_name.first.hiragana, gimei_name.first.katakana].sample }
    last_name_zenkaku     { [gimei_name.last.kanji, gimei_name.last.hiragana, gimei_name.last.katakana].sample }
    first_name_katakana   { gimei_name.first.katakana }
    last_name_katakana    { gimei_name.last.katakana }
    birthday              { Faker::Date.birthday(min_age: 20, max_age: 80) }
  end
end
