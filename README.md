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


## users

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|email|string|null: false, foreign_key: true|
|password|integer|null: false, foreign_key: true|
|name|string|null: false|

### Association
- has_many : chattexts
- belongs_to : group

## chattexts
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foreign_key: true|
|text|text|null: false|
|create_at|datetime|null: false|

## Association
- belongs_to : user
- belongs_to : group


## groups
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|text|text|null: false|
## Association
- has_many users
- has_many chattexts

## group_users
|Column|Type|Options|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

## Association
- berongs_to :user
- berongs_to :group






