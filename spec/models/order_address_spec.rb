require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '注文' do
    context '注文できるとき' do
      it '郵便番号、都道府県、市、住所、建物名、電話番号が存在すれば注文できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも注文できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '注文できないとき' do
      it '郵便番号が空では注文できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が初期状態だと注文できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市が空では注文できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '住所が空では注文できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では注文できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号が全角数字だと注文できない' do
        @order_address.post_code = '１００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号に(-)がないと注文できない' do
        @order_address.post_code = '1008111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '市が半角英字だと注文できない' do
        @order_address.city = 'test'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('City は全角文字を使用してください')
      end
      it '電話番号が全角数字だと注文できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字で入力してください')
      end
      it '電話番号に(-)があると注文できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角数字で入力してください')
      end
      it 'userが紐付いていないと注文できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと注文できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
  describe '保存' do
    context '保存できる時'
    it '保存できる' do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user: user)
      order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)

      expect { order_address.save }.to change(Order, :count).by(1).and change(Address, :count).by(1)
    end
  end
end
