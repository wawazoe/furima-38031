require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '新規登録できる時' do
    it 'nickname,password,password_confirmation,first_name,lastname,first_kana,last_kana,birtdayが存在したら登録できる' do

    end
  end
  context '新規登録できない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'nicknameが41文字以上では登録できない' do
      @user.nickname = Faker::Internet.nickname(min_length: 41)
      @user.nickname = @user.nickname
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Nicname is too short (minimum is 6 characters)')
    end
    it 'パスワードが英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
    end
    it 'パスワードが数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.erros.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken') 
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("last_name can't be blank")
    end
    it 'first_kanaが空では登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("first_kana can't be blank")
    end
    it 'last_kanaが空では登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("last_kana can't be blank")
    end
    it 'first_nameが全角入力でなければ登録できないこと' do
      user = build(:user, first_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end
    it 'last_nameが全角入力でなければ登録できないこと' do
      user = build(:user, last_name: "ｱｲｳｴｵ") 
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end
    it 'first_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, first_kana: "あいうえお") 
      user.valid?
      expect(user.errors[:first_kana]).to include("は不正な値です")
    end
    it 'last_kanaが全角カタカナでなければ登録できないこと' do
      user = build(:user, last_kana: "あいうえお") 
      user.valid?
      expect(user.errors[:last_kana]).to include("は不正な値です")
    end
  end
  end
end
