require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    describe '商品出品' do
      context '商品出品できる時' do
        it 'name,text,area,category,condition,delivery_charge,duration,price,userが存在したら出品できる' do
        end
  end
  context '商品出品できない時' do
    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空では出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'areaが空では出品できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it 'categoryが空では出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'conditionが空では出品できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'delivery_chargeが空では出品できない' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'durationが空では出品できない' do
      @item.duration_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Duration can't be blank")
    end
    it 'priceが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceは半角入力でなければ登録できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it 'userが結びついていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
end
