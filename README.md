## usersテーブル

|Column|Type|Options|
|------|----|-------|
|profile_id|integer|null: false ,foreign_key|
|point|integer||
|payment|string|null:false|
|mailaddress|string|null:false ,unique:true|
|password|string|null:false ,unique:true|
|profile_comment|text||
|transfer|sting|null:false|

### Association
- belongs_to :profile
- belongs_to :evaluation
- belongs_to :transaction
- has_many :items
- has_many :todos
- has_many :sales
- has_many :sale_hists
- has_many :exhibits
- has_many :Transfer_appli_hists
- has_many :comments
- has_many :purchaseis
- has_many :evaluations
- has_many :transactions





## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
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
- has_many :users



## Todosテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|todo|text|null: false|

### Association
- belongs_to :user



## Transfer_appli_histsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|history|string|null: false|
|time|timestamps|null: false

### Association
- belongs_to :user



## Salesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|sale|integer|null:false|
|limit|timestamps|null:false|
|scedule|timestamps|null:false|

### Association
- belongs_to :user



## Sale_histsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|salehistory|integer|null:false|

### Association
- belongs_to :user



## Exshibitsテーブル

|Column|Type|Options|
|------|----|-------|
|exshibit|string|null: false|
|user_id|integer|null: false, foreign_key:true|

### Association
- belongs_to :user
- has_many: items



## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|picture|string|null: false|
|date_of_shipment|string|null: false|
|description|text|null: false|
|state|string|null: false|
|fee|integer|null: false|
|howmany|string|null: false|
|amount_of_money|integer|null: false|
|user_id|integer|null: false ,foreign_key:true|
|exshibit_id|integer|null: false ,foreign_key:true|
|category_id|integer|null: false ,foreign_key:true|
|brand_id|integer|null: false ,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :exhibit
- belongs_to :category
- belongs_to :brand
- has_many :comments
- has_many :purchaseis
- has_many :transactions



## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false ,foreign_key:true|
|item_id|integer|null: false ,foreign_key:true|
|comment|text|null: false|

### Association
- belongs_to :item
- belongs_to :user



## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|type_id|integer|null:false ,foreign_key:true|

### Association
- belongs_to :type
- has_many :items




## Typesテーブル

|Column|Type|Options|
|------|----|-------|
|type|string|null: false|

### Association
- has_many :categories


## Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|

### Association
- has_many :items



## Purchaseisテーブル

|Column|Type|Options|
|------|----|-------|
|purchase|string|null: false|
|user_id|integer|null: false ,foreign_key:true|
|item_id|integer|null: false ,foreign_key:true|

### Association
- belongs_to :item
- belongs_to :user



## Evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|evaluation|string|null: false|
|user_id|integer|null: false,foreign_key:true|

### Association
- belongs_to :user



## Transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|transaction|string|null: false|
|user_id|integer|null: false ,foreign_key:true|
|item_id|integer|null: false ,foreign_key:true|

### Association
- belongs_to :item
- belongs_to :user