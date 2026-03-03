FactoryBot.define do
  factory :user do
    transient do
      gimei_name { Gimei.name }
    end

    nick_name             { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kanji      { gimei_name.first.kanji }
    last_name_kanji       { gimei_name.last.kanji }
    first_name_kana       { gimei_name.first.katakana }
    last_name_kana        { gimei_name.last.katakana }
    birthday              { Faker::Date.birthday(min_age: 20, max_age: 80) }
  end
end
