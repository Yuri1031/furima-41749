# テーブル設計
## users テーブル -------------------------------------------
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| family_name        | string     | null: false                    |
| personal_name      | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| personal_name_kana | string     | null: false                    |
| nickname           | string     | null: false                    |
| birthday           | date       | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |

- has_many :items
- has_many :purchases


## items テーブル (imageについては、ActiveStorageで実装予定) -----
| Column          | Type       | Options                        |
| --------------- | ---------- | -----------------------------  |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_id     | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase


## purchases テーブル----------------------------------------
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル----------------------------------------
| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| area           | string     | null: false                    |
| num_of_address | string     | null: false                    |
| building       | string     |                                |
| phone_num      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

- belongs_to :purchase




## Active hash list memo ################################
## prefecture --------------------------------------
## delivery ----------------------------------------
## shipping_day ------------------------------------
## condition ---------------------------------------
## category ----------------------------------------
