# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_write   | string | null: false               |
| last_name_write    | string | null: false               |
| first_name_reading | string | null: false               |
| last_name_reading  | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many   : orders
- has_many   : items

## items テーブル

| Column             | Type       | Options                              |
| ------------------ | ---------- | ------------------------------------ |
| name               | string     | null: false                          |
| explanation        | text       | null: false                          |
| category_id        | integer    | null: false                          |
| situation_id       | integer    | null: false                          |
| load_id            | integer    | null: false                          |
| region_id          | integer    | null: false                          |
| day_id             | integer    | null: false                          |
| price              | integer    | null: false, precision: 10           |
| user               | references | null: false, foreign_key: true       |


### Association

- belongs_to             : user
- has_one                : order
- belongs_to_active_hash : category
- belongs_to_active_hash : situation 
- belongs_to_active_hash : load 
- belongs_to_active_hash : region  
- belongs_to_active_hash : day  


## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| address_line1   | string     | null: false                    |
| address_line2   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to             : order
- belongs_to_active_hash : prefectures

## orders テーブル

| Column  | Type       | Options                              |
| ------- | ---------- | ------------------------------------ |
| user    | references | null: false, foreign_key: true       |
| item    | references | null: false, foreign_key: true       |

### Association

- belongs_to :user
- has_one    :address
- belongs_to :item
