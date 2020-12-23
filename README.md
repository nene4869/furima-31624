# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------------   | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| surname            | string | null: false |
| family_name        | string | null: false |
| surname_k          | string | null: false |
| family_name_k      | string | null: false |
| birth_date          | date   | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | -----------| ----------------------------   |
| user                | references | null: false, foreign_key: true |   
| name                | string     | null: false                    |   
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| product_condition_id| integer    | null: false,                   |
| shipping_charge_id  | integer    | null: false,                   |
| prefecture_id       | integer    | null: false,                   |
| day_id              | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association
-has_one :order  
-belongs_to :user


## order テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association
-belongs_to :user
-belongs_to :item
-has_one :address


### addressesテーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| addresses     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |
|postal_code    | string     | null: false                    |
|prefecture_id  | integer    | null: false,                   |
|municipalities | string     | null: false,                   |
|house_number   | string     | null: false,                   |
|building_name  | string     |                                |
|phone_number   | string     | null: false,                   |



### Association
 -belongs_to :order
 
