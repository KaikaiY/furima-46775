FactoryBot.define do
  factory :order_address do
    post_code { '100-8111' }
    prefecture_id { 2 }
    city { 'テスト市' }
    address { 'テスト1-1-1' }
    building_name { 'テストビル' }
    phone_number { '09012345678' }
    user_id { 2 }
    item_id { 2 }
  end
end
