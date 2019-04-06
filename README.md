## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|userinformation_id|integer|null: false ,foreign_key|
|point|integer||
|payment|string|null:false|
|mailaddress|string|null:false ,unique:true|
|password|string|null:false ,unique:true|
|profile_comment|text||
|transfer|sting|null:false|
|evluation_id|integer||
|transaction_id|integer||

### Association
- belongs_to :evaluation
- belongs_to :transaction
- has_many :user_informations
- has_many :todos
- has_many :sales
- has_many :sale_histories
- has_many :exhibits
- has_many :transfer_applications



## User_informationsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null:false|
|name|string|null:false|
|name_kana|string|null:false|
|postal_code|integer|null:false|
|predecture|string|null:false|
|city|string|null:false|
|address|integer|null:false|
|building|string||
|phone_number|integer|null:false|
|nickname|string|null:false|

### Association
- belongs_to :user



## Todosテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false, foreign_key:true|
|todo|text|null: false|

### Association
- belongs_to :user



## Transferapplicationhistotoriesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false, foreign_key:true|
|history|string|null: false|
|time|timestamps|null: false

### Association
- belongs_to :user



## Salesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false, foreign_key:true|
|sale|integer|null:false|
|limit|timestamps|null:false|
|scedule|timestamps|null:false|

### Association
- belongs_to :user



## Salehistoriesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false, foreign_key:true|
|salehistory|integer|null:false|

### Association
- belongs_to :user



## Exshibitsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false, foreign_key:true|
|item_id|integer|null: false, foreign_key:true|

### Association
- belongs_to :user
- has_many :items



## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
|picture|string|null: false|
|user_id|integer|null: false ,foreign_key:true|
|date_of_shipment|string|null: false|
|description|text|null: false|
|state|string|null: false|
|fee|integer|null: false|
|howmany|string|null: false|
|amount_of_money|integer|null: false|
|exshibit_id|integer|null: false ,foreign_key:true|
|category_id|integer|null: false ,foreign_key:true|
|brand_id|integer|null: false ,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :exhibit
- has_many :categories
- has_many :brands



## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false ,foreign_key:true|
|item_id|integer|null: false ,foreign_key:true|
|comment|text|null: false|

### Association
- belongs_to :item
- has_many :users



## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|category|string|null: false|
|type_id|integer|null:false ,foreign_key:true|

### Association
- belongs_to :item
- has_many :types



## Typesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|type|string|null: false|

### Association
- belongs_to :category



## Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|brand|string|null: false|

### Association
- belongs_to :item



## Purchaseisテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false ,foreign_key:true|
|item_id|integer|null: false ,foreign_key:true|

### Association
- has_many :users
- has_many :items



## Evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|evaluation|string|null: false|

### Association
- belongs_to :user



## Transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false ,foreign_key:true|
|item_id|integer|null: false ,foreign_key:true|

### Association
- has_many :items
- has_many :users