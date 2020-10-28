# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kana_first_name    | string | null: false |
| kana_last_name     | string | null: false |
| birthday           | date   | null: false |

### association

has_many :orders
has_many :items

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### association

belongs_to :item
belongs_to :user
has_one :address

## addresses

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| zip_code     | string     | null: false                    |
| city         | integer    | null: false                    |
| region       | string     | null: false                    |
| building     | string     |                                |
| house_number | string     | null: false                    |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### association

belongs_to :order

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| description       | text       | null: false                    |
| category          | integer    | null: false                    |
| condition         | integer    | null: false                    |
| delivery_fee      | integer    | null: false                    |
| Shipping_location | integer    | null: false                    |
| shipment_date     | date       | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### association

has_one :user
has_one :order
has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| body   | string     |                                |
| item   | references | null: false, foreign_key: true |

### association

belongs_to :item
