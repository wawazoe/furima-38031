class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.timestamps
       t.references :user ,null: false, foreign_key: true
       t.references :item ,null: false, foreign_key: true

    end
  end
end



# | Column         | Type       | Options                        |
# |----------------|------------|--------------------------------|
# | user           | references | null: false, foreign_key: true |
# | item           | references | null: false, foreign_key: true |
