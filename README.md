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


## groups_usersテーブル

|Column|Type|Option|
|:----:|:--:|:----:|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association

- belongs_to :group
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|:----:|:--:|:-----:|
|name|string|null: false|
|email|string|null: false, unique: true|

### Association

- has_many :members
- has_many :groups, through: :members
- has_many :messages


## groupsテーブル

|column|Type|Options|
|:----:|:--:|:-----:|
|name|string|null: false|

### Association

- has_many :members
- has_manny :users, through: :members
- has_many :messages


## messagesテーブル

|column|Type|Options|
|:----:|:--:|:-----:|
|text|string||
|image|string|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association

- belongs_to :group
- belongs_to :user