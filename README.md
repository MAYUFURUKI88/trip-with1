# テーブル設計

##  users テーブル

| Column                | Type    | Options     |
| --------              | ------  | ----------- |
| nickname              | string  | null: false |
| encrypted_password    | string  | null: false |
| password_confirmation | string  | null: false |
| email                 | string  | null: false |
| sex_id                | integer |             |
| age_id                | integer |             |
| prefecture_id         | integer |             |


### Association

- has_many :plans
- has_many :joints
- has_many :comments

## plans テーブル

| Column          | Type       | Options                        |
| ------          | ------     | -----------                    |
| title           | string     | null: false                    |
| trip_id         | integer    | null: false                    |
| first_day       | date       | null: false                    |
| final_day       | date       | null: false                    |
| price           | integer    | null: false                    |
| capacity_id     | integer    | null: false                    |
| deadline        | date       | null: false                    |
| message         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :joints
- has_many :comments


## joints テーブル

| Column  | Type       | Options                           |
| ------  | ------     | -----------                       |
| user    | references | null: false, foreign_key: true    |
| plan    | references | null: false, foreign_key: true    |


### Association

- belongs_to :plan
- belongs_to :user

## comments テーブル

| Column  | Type       | Options                           |
| ------  | ------     | -----------                       |
| user    | references | null: false, foreign_key: true    |
| plan    | references | null: false, foreign_key: true    |
| content | text       | null: false                       |

### Association


- belongs_to :user
- belongs_to :plan