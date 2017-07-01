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
|id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|email|string|null: false|
|password|integer|null: false|
|name|string|null: false|

### Association
- has_many : chat_texts
- has_many : groups, through_group_users


## chat_texts
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|group_id|references|null: false, index: true|
|user_id|references|null: false, index: true|
|text|text|null: false|
|create_at|datetime|null: false|

## Association
- belongs_to : user
- belongs_to : group

t.references :user, index: true
t.references :group, index: true

## groups
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association
- has_many : users, through_group_users
- has_many : chat_texts


## group_users
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|references|null: false, index: true|

## Association
- berongs_to : user
- berongs_to : group

