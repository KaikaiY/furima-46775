# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nick_name          | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday           | date   | null: true  |

### Association
- has_many :items
- has_many :orders

### Index
- add_index :users, :email, unique: true

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| item_name     | string     | null: false |
| category_id   | integer    | null: false, ActiveHash |
| condition_id  | integer    | null: false, ActiveHash |
| fee_id        | integer    | null: false, ActiveHash |
| prefecture_id | integer    | null: false, ActiveHash |
| delivery_id   | integer    | null: false, ActiveHash |
| price         | bigint     | null: false |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| user         | references | null: false, foreign_key: true|
| item         | references | null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

### Index
- add_index :orders, :item_id, unique: true


## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| post_code     | string     | null: false |
| prefecture_id | integer    | null: false, ActiveHash |
| city          | string     | null: false |
| address_line1 | string     | null: false |
| address_line2 | string     | null: true  |
| phone_number  | string     | null: true  |
| order         | references | null: false, foreign_key: true|


### Association
- belongs_to :order

### Index
- add_index :addresses, :order_id, unique: true
