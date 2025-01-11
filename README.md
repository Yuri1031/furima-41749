# テーブル設計
## users テーブル -------------------------------------------
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| id                 |            |                                |
| name               | string     | null: false                    |
| name-kana          | string     | null: false                    |
| nickname           | string     | null: false                    |
| birthday           | integer    | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| items_id           | references | null: false, foreign_key: true |
| purchases_id       | references | null: false, foreign_key: true |

- has_many :items
- has_many :purchases


## items テーブル (imageについては、ActiveStorageで実装予定) -----
| Column       | Type       | Options                        |
| ------------ | ---------- | -----------------------------  |
| id           |            |                                |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | references | null: false, foreign_key: true |
| condition_id | references | null: false, foreign_key: true |
| shipping_id  | references | null: false, foreign_key: true |
| users_id     | references | null: false, foreign_key: true |
| purchases_id | references | null: false, foreign_key: true |

- belong_to :users
- has_one :categories
- has_one :shipping
- has_one :conditions
- has_one :purchases


## purchases テーブル----------------------------------------
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           |            |                                |
| name         | string     | null: false                    |
| address_id   | references | null: false, foreign_key: true |
| items_id     | references | null: false, foreign_key: true |

- belong_to :users
- belong_to :items
- has_one :addresses


## addresses テーブル----------------------------------------
| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| id             |            |                                |
| post-code      | integer    | null: false                    |
| area           | string     | null: false                    |
| num-of-address | string     | null: false                    |
| building       | string     | null: true                     |
| phone-num      | integer    | null: false                    |
| prefectures_id | references | null: false, foreign_key: true |
| purchases_id   | references | null: false, foreign_key: true |

- belong_to :purchases
- has_one :prefectures


## prefectures テーブル--------------------------------------
##　(４７都道府県情報を登録。)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| id     |            |                                |
| name   | string     | null: false                    |

- belong_to :shipping
- belong_to :addresses


## shipping テーブル-----------------------------------------
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| id               |            |                                |
| items_id         | references | null: false, foreign_key: true |
| deliveries_id    | references | null: false, foreign_key: true |
| prefectures_id   | references | null: false, foreign_key: true |
| shipping-day _id | references | null: false, foreign_key: true |

- belong_to :items
- has_one :deliveries
- has_one :prefectures
- has_one :shipping-days


## deliveries テーブル---------------------------------------
## (「着払い」「送料込み」を登録。)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| id     |            |                                |
| name   | string     | null: false                    |

- belong_to :shipping


## shipping-days テーブル-------------------------------------
## (「1~2日」「2~3日」「4~7日」を登録)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| id     |            |                                |
| name   | string     | null: false                    |

- belong_to :shipping


## conditions テーブル----------------------------------------
## (「新品...」...を登録)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| id     |            |                                |
| name   | string     | null: false                    |

- belong_to :shipping


## categories テーブル----------------------------------------
## (「メンズ」...を登録)
| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| id     |            |                                |
| name   | string     | null: false                    |

- belong_to :items