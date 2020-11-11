# アプリケーション名
trip-with1

# アプリケーション概要
ユーザーは旅行の企画を投稿し、その企画に参加して一緒に旅をすることができます。  
投稿者は企画の編集、削除ができます。  
旅行に参加後は参加者同士でチャットのやり取りができます。  
マイページでプロフィールの編集、企画中の旅行、参加中の旅行、お気に入りした旅行を確認できます。

# URL

# テスト用アカウント

# 利用方法
・トップページの旅を計画するボタン押下→計画情報入力→一覧に投稿した企画が表示  
・トップページから企画選択→詳細ページから旅行に参加ボタン押下→参加後チャットページに遷移  
・トップページ、ログイン中ユーザー名からマイページに遷移

# 目指した課題解決
お祭りやキャンプなどに参加したいが、友人と都合が合わない。  
行きたいところがあるが一人旅だと寂しいから誰かと一緒に行きたい。  
このような問題を解決するために、行きたい旅行を計画できる、気になる計画があればそれに参加して一緒に旅に行ける。というサービスを作りました。

# 洗い出した要件
新規登録機能  
ログイン,アウト機能  
旅行企画投稿機能  
企画一覧表示機能  
企画編集,削除機能  
企画詳細表示機能  
企画に参加機能  
参加後のチャット機能  
マイページ機能(プロフィール編集)  
検索機能  
ページネーション機能  
お気に入り機能  
SNSログイン  
AWS  

# 実装予定の機能
通知機能  

# ローカルでの動作方法
Ruby6.0.0





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
- has_many :joint_plans, through: :joints, class_name :"Plan"
- has_many :messages
- has_many :sns_credentials
- has_many :likes
- has_many :liked_plans, through :likes, source: :plan

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

- has_many :joints
- has_many :users, through: :joints
- has_many :messages
- has_many :likes
- has_many :liked_users, through: :likes, source: :user


## joints テーブル

| Column  | Type       | Options                           |
| ------  | ------     | -----------                       |
| user    | references | null: false, foreign_key: true    |
| plan    | references | null: false, foreign_key: true    |


### Association

- belongs_to :plan
- belongs_to :user

## likes テーブル

| Column  | Type       | Options                           |
| ------  | ------     | -----------                       |
| user    | references | null: false, foreign_key: true    |
| plan    | references | null: false, foreign_key: true    |

### Association


- belongs_to :user
- belongs_to :plan

## messages テーブル

| Column  | Type       | Options                           |
| ------  | ------     | -----------                       |
| text    | text       | null: false                       |
| user    | references | null: false, foreign_key: true    |
| plan    | references | null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :plan 

## sns_credentials テーブル

| Column   | Type       | Options           |
| ------   | ------     | -----------       |
| provider | string     |                   |
| uid      | string     |                   |
| user     | references | foreign_key: true |

### Association

- belongs_to :user


