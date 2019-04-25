## users テーブル

| Column          | Type    | Options                 |
| --------------- | ------- | ----------------------- |
| name            | string  | null:false              |
| name_kana       | string  | null:false              |
| nickname        | string  | null:false              |
| mail_address    | string  | null:false ,unique:true |
| password        | string  | null:false ,unique:true |
| profile_comment | text    |                         |
| point           | integer |                         |
| payment         | string  | null:false              |
| transfer        | string  | null:false              |

### Association

- has_one :address
- has_many :items
- has_many :todos
- has_many :sales
- has_many :sale_hists
- has_many :exhibits
- has_many :transfer_appli_hists
- has_many :comments
- has_many :purchaseis
- has_many :evaluations
- has_many :transactions

## Addresses テーブル

| Column        | Type       | Options                  |
| ------------- | ---------- | ------------------------ |
| user_id       | references | null: false ,foreign_key |
| postal_code   | string     | null:false               |
| prefecture    | string     | null:false               |
| city          | string     | null:false               |
| block_number  | string     | null:false               |
| building_name | string     |                          |
| phone_number  | string     | null:false               |

### Association

- belongs_to :user

## Todos テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user_id | references | null: false, foreign_key:true |
| message | text       | null: false                   |

### Association

- belongs_to :user

## Transfer_appli_hists テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user_id | referenses | null: false, foreign_key:true |
| history | string     | null: false                   |
| time    | timestamps | null: false                   |

### Association

- belongs_to :user

## Sales テーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| user_id  | references | null: false, foreign_key:true |
| name     | string     | null:false                    |
| limit    | timestamps | null:false                    |
| schedule | timestamps | null:false                    |

### Association

- belongs_to :user

## Exshibits テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| name    | string     | null: false                   |
| user_id | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_many: items

## Items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| date_of_shipment | string     | null: false                   |
| description      | text       | null: false                   |
| state            | string     | null: false                   |
| fee              | integer    | null: false                   |
| quantity         | integer    | null: false                   |
| price            | integer    | null: false                   |
| user_id          | references | null: false ,foreign_key:true |
| exshibit_id      | references | null: false ,foreign_key:true |
| category_id      | references | null: false ,foreign_key:true |
| brand_id         | references | null: false ,foreign_key:true |

### Association

- belongs_to :user
- belongs_to :exhibit
- belongs_to :category
- belongs_to :brand
- has_many :pictures
- has_many :comments
- has_many :purchaseis
- has_many :transactions

## Pictures テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| name    | string     | null: false                   |
| item_id | references | null: false, foreign_key:true |

### Association

- belongs_to :item

## Comments テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user_id | references | null: false ,foreign_key:true |
| item_id | references | null: false ,foreign_key:true |
| message | text       | null: false                   |

### Association

- belongs_to :item
- belongs_to :user

## Categories テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| name      | string     | null: false                   |
| parent_id | references | null: false, foreign_key:true |

### Association

- belongs_to :parent
- has_many :items
- has_many :children, foreign_key: :parent_id

## Brands テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :items

## Purchaseis テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| sall_history | string     | null: false                   |
| buy_history  | string     | null: false                   |
| status       | enum       | null: false                   |
| user_id      | references | null: false ,foreign_key:true |
| item_id      | references | null: false ,foreign_key:true |

### Association

- belongs_to :item
- belongs_to :user

## Evaluations テーブル

| Column     | Type       | Options                      |
| ---------- | ---------- | ---------------------------- |
| evaluation | string     | null: false                  |
| user_id    | references | null: false,foreign_key:true |

### Association

- belongs_to :user
