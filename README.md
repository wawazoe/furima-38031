## users

| Column                 | Type    | Option                    |
|------------------------|---------|---------------------------|
| nickname               | string  | null: false               |
| encrypted_password     | string  | null: false               |
| email                  | string  | null: false, unique: true |
| birth_day              | date    | null: false               |
| first_name             | string  | null: false               |
| last_name              | string  | null: false               |
| first_kana             | string  | null: false               | 
| last_kana              | string  | null: false               | 
 


### Association

- has_many :items
- has_many :buys



## items

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| text               | text       | null: false                    | 
| area_id            | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| duration_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
- has_one :buy
- belongs_to :user


## buys

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| nickname_id    | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings

| Column         | Type        | Options                        |
|----------------|-------------|--------------------------------|
| post_code      | string      | null: false                    |
| area_id        | integer     | null: false                    |
| municipalities | string      | null: false                    |
| address        | string      | null: false                    |
| building_name  | string      |                                |
| phone_number   | string      | null: false                    |
| buy            | references  | null: false, foreign_key: true |



### Association
- belongs_to :buy
