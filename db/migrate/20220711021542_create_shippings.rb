class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string  :post_code,      null: false
      t.integer :area_id,        null: false
      t.string  :municipalities, null: false
      t.string  :address,        null: false
      t.string  :building_name,  null: false
      t.string  :phone_number,   null: false
      t.references :buy,         null: false, foreign_key: true
      t.timestamps
    end
  end
end


## shippings

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