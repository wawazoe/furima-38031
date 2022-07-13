class BuyShipping

  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
 with_options presence: true do
  validates :post_code,    format: {with: /\A\d{3}[-]\d{4}\z/ } 
  validates :area_id
  validates :municipalities
  validates :address
  validates :phone_number, format: {with: /\A\d{10,11}\z/ }
  validates :token
end

  def save
    # 各テーブルにデータを保存する処理を書く
    buy = Buy.create(user_id: user_id, item_id: item_id )
    Shipping.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, phone_number: phone_number, building_name: building_name, buy_id: buy.id)
  end
end
