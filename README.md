# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| first_name_write   | string | null: false               |
| last_name_write    | string | null: false               |
| first_name_reading | string | null: false               |
| last_name_reading  | string | null: false               |
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |

### Association

- has_many   : orders

## goods テーブル

| Column             | Type       | Options                              |
| ------------------ | ---------- | ------------------------------------ |
| name               | string     | null: false                          |
| explanation        | text       | null: false                          |
| price              | decimal    | null: false, precision: 10, scale: 2 |
| user               | references | null: false, foreign_key: true       |

### Association

- belongs_to :user

## address テーブル

| Column          | Type   | Options                        |
| --------------- | ------ | ------------------------------ |
| post_code       | string | null: false                    |
| address_1       | string | null: false                    |
| address_2       | string | null: false                    |
| phone_number    | string | null: false                    |
| recipient_name  | string | null: false                    |

### Association

- belongs_to :user
- belongs_to :goods

## orders テーブル

| Column  | Type       | Options                              |
| ------- | ---------- | ------------------------------------ |
| user    | references | null: false, foreign_key: true       |
| goods   | references | null: false, foreign_key: true       |

### Association

- belongs_to :user
