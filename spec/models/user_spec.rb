require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、、お名前、お名前（カナ）、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1234561'
        @user.password_confirmation = '1234562'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字(全角)が空では登録できない' do
        @user.first_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku can't be blank")
      end
      it '名前(全角)が空では登録できない' do
        @user.last_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku can't be blank")
      end
      it '名字(カナ)が空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it '名前(カナ)が空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a2345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英字のみでは登録できない' do
        @user.password = 'password'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角の英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角の英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、全角を含むと登録できない' do
        @user.password = 'あいう123456avito'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角の英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、記号を含むと登録できない' do
        @user.password = '@a12s3456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角の英字と数字の両方を含めて設定してください')
      end

      it '名字(全角)が半角では登録できない' do
        @user.first_name_zenkaku = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include('First name zenkaku 全角文字を使用してください')
      end
      it '名前(全角)が半角では登録できない' do
        @user.last_name_zenkaku = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name zenkaku 全角文字を使用してください')
      end
      it '名字(カナ)が半角では登録できない' do
        @user.first_name_katakana = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana カタカナを使用してください')
      end
      it '名前(カナ)が半角では登録できない' do
        @user.last_name_katakana = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana カタカナを使用してください')
      end
      it '名字(カナ)が全角漢字では登録できない' do
        @user.first_name_katakana = Gimei.name.first.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana カタカナを使用してください')
      end
      it '名前(カナ)が全角漢字では登録できない' do
        @user.last_name_katakana = Gimei.name.last.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana カタカナを使用してください')
      end
    end
  end
end
