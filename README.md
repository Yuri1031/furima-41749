# テーブル設計
## user テーブル -------------------------------------------
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
- has_many :purchase


## item テーブル (imageについては、ActiveStorageで実装予定) -----
| Column       | Type       | Options                        |
| ------------ | ---------- | -----------------------------  |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| shipping_id  | integer    | null: false                    |
| purchase_id  | references | null: false                    |

- belong_to :user
- belongs_to :category
- belongs_to :shipping
- belongs_to :condition
- has_one :purchase


## purchase テーブル----------------------------------------
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belong_to :user
- belong_to :items
- has_one :addresses


## address テーブル----------------------------------------
| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| area           | string     | null: false                    |
| num_of_address | string     | null: false                    |
| building       | string     | null: true                     |
| phone_num      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

- belong_to :purchase
- belongs_to :prefectures


## shipping テーブル-----------------------------------------
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| deliveries_id    | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| shipping_day _id | integer    | null: false                    |

- belong_to :items
- has_one :deliveries
- has_one :prefectures
- has_one :shipping_day






## (以下は、Activehash を用いるため削除。自分自身がイメージできるようにあえて残させてください。イメージが定着したら削除いたします。 m(_ _)m)

## Active hash #############################################
## prefecture テーブル--------------------------------------
##　(４７都道府県情報を登録。)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |

- belong_to :shipping
- belong_to :addresses


## delivery テーブル---------------------------------------
## (「着払い」「送料込み」を登録。)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |

- belong_to :shipping


## shipping_day テーブル-------------------------------------
## (「1~2日」「2~3日」「4~7日」を登録)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |

- belong_to :shipping


## condition テーブル----------------------------------------
## (「新品...」...を登録)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |

- belong_to :shipping


## category テーブル----------------------------------------
## (「メンズ」...を登録)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| name   | string     | null: false                    |

- belong_to :items