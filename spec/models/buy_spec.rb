require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it 'すべての項目が正しく入力されていれば購入できる' do
      end
      it '建物名は空でも購入できる' do
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

  it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
    @buy_shipping.post_code = '1111111'
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Post code is invalid")
  end

   it '都道府県の値が0では購入できない' do
     @buy_shipping.area_id = '0'
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
   it '電話番号は - を含むと購入できない' do
    @buy_shipping.phone_number = '0-0'
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Phone number is invalid")
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


  it 'itemが紐づいていないと購入できない' do
    @buy_shipping.item_id = nil
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
  end
  it 'userが紐づいていないと購入できない' do
    @buy_shipping.user_id = nil
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
  end

  it 'Tokenが空では購入できない' do
    @buy_shipping.token = nil
    @buy_shipping.valid?
    expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
  end
end
end
end
