# 

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |

### Association
has_many : prototypes
has_many : comments


## prototypes テーブル

| Column       | Type       | Options                        |
| ------       | ------     | -----------                    |
| title        | string     | null: false                    |
| catch_copy   | string     | null: false                    |
| concept      | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
belongs_to : user
has_many : comments


## comments ーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| content   | text       | null: false,                   |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
belongs_to : user
belongs_to : prototype
