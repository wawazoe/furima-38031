class Shipping < ApplicationRecord
belongs_to :buy





# ## shippings

# | Column         | Type        | Options                        |
# |----------------|-------------|--------------------------------|
# | post_code      | string      | null: false                    |
# | area_id        | integer     | null: false                    |
# | municipalities | string      | null: false                    |
# | address        | string      | null: false                    |
# | building_name  | string      |                                |
# | phone_number   | string      | null: false                    |
# | buy            | references  | null: false, foreign_key: true |



# ### Association
# - belongs_to :buy
end