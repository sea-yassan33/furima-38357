# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_one :pay


## itemsテーブル
| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| info                    | text       | null: false                    |
| category_id             | string     | null: false                    |
| sales_status_id         | string     | null: false                    |
| shipping_fee_status_id  | string     | null: false                    |
| prefecture_id           | string     | null: false                    |
| scheduled_delivery_id   | string     | null: false                    |
| price                   | integer    | null: false                    |
| sold                    | float      | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## payテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     | null: true                    |
| phone_number       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :user
- attr_accessor :token