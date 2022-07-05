class Item < ApplicationRecord
  belongs_to :user
 # has_one :buy     //未実装のため
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :condition
 belongs_to :delivery_charge
 belongs_to :area
 belongs_to :duration

 with_options :presence true format:{with: /\A[0-9]+\z/, message: 'Price is invalid. Input half-width characters'} do
  validates :price
 end               //syntax error出た
 validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"} 
 validates :condition_id,       numericality: { other_than: 1 , message: "can't be blank"}
 validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :area_id,            numericality: { other_than: 0 , message: "can't be blank"} 
 validates :duration_id,        numericality: { other_than: 1 , message: "can't be blank"}


end
