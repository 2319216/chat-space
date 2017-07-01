## users

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|email|string|null: false|
|password|integer|null: false|
|name|string|add_index :users, :name, null: false, unique: true|

### Association
- has_many : messages
- has_many : groups, through: :group_users


## messages
|Column|Type|Options|
|------|----|-------|
|group_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|text|text|null: false|
|create_at|datetime|null: false|

## Association
- belongs_to : user
- belongs_to : group


## groups
|Column|Type|Options|
|------|----|-------|
|name|string|add_index :users, :name, null: false, unique: true|

## Association
- has_many : users, through: :group_users
- has_many : messages
- has_many : group_users


## group_users
|Column|Type|Options|
|------|----|-------|
|group_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

## Association
- berongs_to : user
- berongs_to : group

