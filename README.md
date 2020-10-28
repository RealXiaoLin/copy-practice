# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| kana_first_name | string | null: false |
| kana_last_name  | string | null: false |
| birthday        | date   | null: false |

### association

has_many :orders
has_many :items

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| valid_date    | date       | null: false                    |
| security_code | integer    | null: false                    |
| zip_code      | integer    | null: false                    |
| city          | string     | null: false                    |
| region        | string     | null: false                    |
| house_number  | integer    | null: false                    |
| phone_number  | integer    | null: false                    |
| building      | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### association

belongs_to :item
belongs_to :user

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| image             |            | ActiveStorage                  |
| title             | string     | null: false                    |
| description       | text       | null: false                    |
| category          | string     | null: false                    |
| condition         | string     | null: false                    |
| delivery_fee      | integer    | null: false                    |
| Shipping_location | string     | null: false                    |
| shipment_date     | date       | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### association

has_one :order
has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| body   | string     |                                |
| item   | references | null: false, foreign_key: true |

### association

belongs_to :item
