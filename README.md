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
- has_one_attached:image


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
# category ----------------------------------------
   # ・レディース
   # ・メンズ
   # ・ベビー・キッズ
   # ・インテリア・住まい・小物
   # ・本・音楽・ゲーム
   # ・おもちゃ・ホビー・グッズ
   # ・家電・スマホ・カメラ
   # ・スポーツ
   # ・レジャー
   # ・その他

# condition ---------------------------------------
   # ・新品・未使用
   # ・未使用に近い
   # ・目立った傷や汚れなし
   # ・やや傷や汚れあり
   # ・傷や汚れあり
   # ・全体的に状態が悪い

# shipping_day ------------------------------------
   # ・着払い(購入者負担)
   # ・送料込み（出品者負担）

# prefecture --------------------------------------
   # ・47都道府県

# delivery ----------------------------------------
   # ・1~2日で発送
   # ・3~4日で発送
   # ・4~7日で発送
