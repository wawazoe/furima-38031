require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    @buy_shipping = FactoryBot.build(:buy_shipping)
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it 'すべての項目が正しく入力されていれば購入できる' do
      end
end
 context '商品購入できない時' do
   it '郵便番号が空では購入できない' do
     @buy_shipping.post_code = ''
     @buy_shipping.valid?
     expect(@buy_shipping.errors.full_messages).to include("Post code can't be blank")
   end
   it '郵便番号は半角文字列でなければいとは購入できない' do
    @buy_shipping.post_code = '１００'
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Post code is invalid")
  end
   it '都道府県が空では購入できない' do
     @buy_shipping.area_id = ''
     @buy_shipping.valid?
     expect(@buy_shipping.errors.full_messages).to include("Area can't be blank")
   end
   it '市区町村が空では出品購入できない' do
     @buy_shipping.municipalities = ''
     @buy_shipping.valid?
     expect(@buy_shipping.errors.full_messages).to include("Municipalities can't be blank")
   end
   it '番地が空では出品購入できない' do
     @buy_shipping.address = ''
     @buy_shipping.valid?
     expect(@buy_shipping.errors.full_messages).to include("Address can't be blank")
   end
   it '電話番号が空では購入できない' do
     @buy_shipping.phone_number = ''
     @buy_shipping.valid?
     expect(@buy_shipping.errors.full_messages).to include("Phone number can't be blank")
   end
   it '電話番号は10桁以上でなければでは購入できない' do
    @buy_shipping.phone_number = '090'
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid")
  end
  it '電話番号は12桁以下でなければでは購入できない' do
    @buy_shipping.phone_number = '09011112222222'
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid")
  end
  it '電話番号は半角数値でなければでは購入できない' do
    @buy_shipping.phone_number = '０９０'
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid")
  end


  it 'Tokenが空では購入できない' do
    @buy_shipping.token = nil
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
  end
end
end
end
