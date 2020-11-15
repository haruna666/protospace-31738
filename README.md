# テーブル設計

## users テーブル

| Colum      | Type    | Options   |
| -----------| --------| ----------|
| email      | string  | not: null |
| password   | string  | not: null |
| name       | string  | not: null |
| profile    | text    | not: null |
| occupation | text    | not: null |
| pasition   | text    | not: null |

### Association

-has_many :prototypes
-has_many :comments

## prototypes テーブル

| Colum       | Type       | Options   |
| title       | string     | not: null |
| catch_copy  | text       | not: null |
| concept     | text       | not: null |
| image       |            |           |
| user        | references |           |

## Association

-belongs_to :users
-has_many :comments

# comments テーブル

| Colum      | Type       | Options       |
| text       | text       | not: null     |
|prototype   | references |               |

## Association

-belongs_to :users
-belongs_to :prototype
