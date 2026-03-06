FactoryBot.define do
  factory :item do
    item_name         { 'テスト商品' }
    item_description  { 'テスト商品です。テスト商品です。テスト商品です。テスト商品です。テスト商品です。テスト商品です。テスト商品です。テスト商品です。' }
    category_id       { 2 }
    condition_id      { 2 }
    fee_id            { 2 }
    prefecture_id     { 2 }
    delivery_id       { 2 }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
