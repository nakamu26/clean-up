# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association

- has_many :normal_reports
- has_many :special_reports
- has_many :illegal_reports

## normal_reports テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| location_id        | integer    | null: false                    |
| number_of_times_id | integer    | null: false                    |
| point              | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## special_reports テーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| location_id | integer    | null: false                    |
| category_id | integer    | null: false                    |
| point       | text       | null: false                    |
| comment     | text       |                                |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## illegal_reports テーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| location_id | integer    | null: false                    |
| point       | text       | null: false                    |
| content     | text       | null: false                    |
| comment     | text       |                                |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user