class Item < ApplicationRecord
  belongs_to :user
 # has_one :buy     //未実装のため
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :condition
 belongs_to :delivery_charge
 belongs_to :area
 belongs_to :duration
 has_one_attached :image

  validates :name,  presence: true
  validates :text,  presence: true
  validates :image, presence: true

 validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

 with_options presence: true,numericality: { other_than: 1 , message: "can't be blank"} do
  validates :category_id
  validates :condition_id
  validates :delivery_charge_id
  validates :duration_id
 end
 validates :area_id, presence: true, numericality: { other_than: 0 , message: "can't be blank"} 


end
