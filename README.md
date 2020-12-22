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
| birthDate          | date   | null: false |

### Association
- has_many items
- has_many purchase＿history 


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | -----------| ----------------------------   |
| user                | references | null: false, foreign_key: true |   
| item_name           | string     | null: false                    |   
| item_description    | string     | null: false                    |
| category_id         | references | null: false, foreign_key: true |
| product_condition_id| references | null: false, foreign_key: true |
| shipping_charges_id | references | null: false, foreign_key: true |
| area_id             | references | null: false, foreign_key: true |
| days_id             | references | null: false  foreign_key: true |
| price               | integer    | null: false                    |



### Association
-has_one purchase＿history  
-belongs_to user

## purchase＿history テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user  id | references | null: false, foreign_key: true |
| item  id | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item

