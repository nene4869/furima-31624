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

| Column        | Type   | Options     |
| ------------  | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| surname_h     | string | null: false |
| family name_h | string | null: false |
| surname_k     | string | null: false |
| family name_k | string | null: false |
| BirthDate     | date   | null: false |

### Association
- has_many items
- has_many comments


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| ----------------------------   |
| user             | references | null: false, foreign_key: true |   
| item name        | string     | null: false                    |   
| item description | string     | null: false                    |



### Association
-has_many  comments
-belongs_to user

## comments_users テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user  id | references | null: false, foreign_key: true |
| room  id | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item

