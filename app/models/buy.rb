class Buy < ApplicationRecord

 belongs_to :item
 belongs_to :user
 has_one :shipping



end





# | Column         | Type       | Options                        |
# |----------------|------------|--------------------------------|
# | user           | references | null: false, foreign_key: true |
# | item           | references | null: false, foreign_key: true |