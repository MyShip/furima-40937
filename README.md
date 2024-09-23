# README

This README would normally document whatever steps are necessary to get the
application up and running.
## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many   : orders
- belongs_to : address

## goods テーブル

| Column             | Type      | Options                              |
| ------------------ | --------- | ------------------------------------ |
| name               | string    | null: false                          |
| image              | text      | null: false                          |
| explanation        | text      | null: false                          |
| price              | decimal   | null: false, precision: 10, scale: 2 |
| user               | string    | null: false, foreign_key: true       |

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

## orders テーブル

| Column  | Type       | Options                              |
| ------- | ---------- | ------------------------------------ |
| user    | references | null: false, foreign_key: true       |
| goods   | references | null: false, foreign_key: true       |
| price   | decimal    | null: false, precision: 10, scale: 2 |

### Association

- belongs_to :user

## card テーブル

| Column        | Type       | Options                              |
| ------------  | ---------- | ------------------------------------ |
| card_number   | string     | null: false                          |
| card_name     | string     | null: false                          |
| date_expiry   | string     | null: false                          |
| security code | string     | null: false                          |

### Association

- belongs_to :user

Things you may want to cover: