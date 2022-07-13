class BuyShipping

  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token

 with_options presence: true do
  validates :post_code,    format: {with: /\A\d{3}[-]\d{4}\z/ } 
  validates :area_id,      numericality: { other_than: 0 , message: "can't be blank"} 
  validates :municipalities
  validates :address
  validates :phone_number, format: {with: /\A\d{10,11}\z/ }
  validates :token
  validates :user_id
  validates :item_id
end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id )
    Shipping.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, phone_number: phone_number, building_name: building_name, buy_id: buy.id)
  end
end
