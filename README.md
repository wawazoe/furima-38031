## users

| Column                 | Type    | Option      |
|------------------------|---------|-------------|
| nickname               | string  | null: false |
| encrypted_password     | string  | null: false |
| email                  | string  | null: false |
| birth_day              | integer | null: false |
| first_name             | string  | null: false |
| last_name              | string  | null: false |
| first_kana             | string  | null: false | 
| last_kana              | string  | null: false | 
 


### Association

- has_many :item
- has_many :buy



## items

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| name               | string     | null: false |
| text               | text       | null: false | 
| area_id            | integer    | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| duration_id        | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false |


### Association
- has_one :buy
- belongs_to :user


## buys

| Column   | Type      | Options                        |
|----------|-----------|--------------------------------|
| nickname | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| area           | references | null: false, foreign_key: true |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |



### Association
- belongs_to :buy
