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
| category           | text       | null: false                          |
| situation          | text       | null: false                          |
| load               | text       | null: false                          |
| region             | text       | null: false                          |
| day                | text       | null: false                          |
| price              | integer    | null: false, precision: 10, scale: 2 |


### Association

- belongs_to :user
- has_one :order

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipalities  | string     | null: false                    |
| address_line1   | string     | null: false                    |
| address_lien2   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| recipient_name  | string     | null: false, foreign_key: true |

### Association

- belongs_to :items
- has_one    :order

## orders テーブル

| Column  | Type       | Options                              |
| ------- | ---------- | ------------------------------------ |
| user    | references | null: false, foreign_key: true       |
| item    | references | null: false, foreign_key: true       |

### Association

- belongs_to :user
- has_one :address
- has_one :item
