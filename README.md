## users

| Column                 | Type     | Option      |
|------------------------|----------|-------------|
| nickname               | string.  | null: false |
| encrypted_password     | string.  | null: false |
| email                  | string.  | null: false |
 


### Association

- has_many :item
- has_many :buy



## items

| Column          | Type       | Options     |
|-----------------|------------|-------------|
| name            | string     | null: false |
| text            | text       | null: false | 
| area            | integer    | null: false |
| category        | integer    | null: false |
| condition       | integer    | null: false |
| delivery_charge | integer    | null: false |
| duration        | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false |


### Association
- has_one :buy
- belongs_to :user


## buys

| Column   | Type   | Options.    |
|----------|--------|-------------|
| nickname | string | null: false |
| item     | string | null: false |


### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| post_code      | integer    | null: false                    |
| prefectures    | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |  |
| phone_number   | integer    | null: false                    |
| buy            | references | null: false, foreign_key: true |



### Association
- belongs_to :buy
