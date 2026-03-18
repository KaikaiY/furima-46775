FactoryBot.define do
  factory :order_address do
    post_code { '100-8111' }
    prefecture_id { 2 }
    city { 'テスト市' }
    address { 'テスト1-1-1' }
    building_name { 'テストビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }

    transient do
      user { build_stubbed(:user) }
      item { build_stubbed(:item, user: user) }
    end

    user_id { user.id }
    item_id { item.id }
  end
end
