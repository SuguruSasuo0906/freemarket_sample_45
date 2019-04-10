## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|name_kana|string|null:false|
|nickname|string|null:false|
|address_id|reference|null: false ,foreign_key|
|mail_address|string|null:false ,unique:true|
|password|string|null:false ,unique:true|
|profile_comment|text||
|point|integer||
|payment|string|null:false|
|transfer|sting|null:false|

### Association
- belongs_to :address
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



## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|block_number|string|null:false|
|building_name|string||
|phone_number|string|null:false|

### Association
- has_one :user



## Todosテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key:true|
|message|text|null: false|

### Association
- belongs_to :user



## Transfer_appli_histsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|referense|null: false, foreign_key:true|
|history|string|null: false|
|time|timestamps|null: false

### Association
- belongs_to :user



## Salesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key:true|
|name|string|null:false|
|limit|timestamps|null:false|
|scedule|timestamps|null:false|

### Association
- belongs_to :user


## Exshibitsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|reference|null: false, foreign_key:true|

### Association
- belongs_to :user
- has_many: items



## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|date_of_shipment|string|null: false|
|description|text|null: false|
|state|string|null: false|
|fee|integer|null: false|
|quantity|integer|null: false|
|price|integer|null: false|
|user_id|reference|null: false ,foreign_key:true|
|exshibit_id|reference|null: false ,foreign_key:true|
|category_id|reference|null: false ,foreign_key:true|
|brand_id|reference|null: false ,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :exhibit
- belongs_to :category
- belongs_to :brand
- has_many :pictures
- has_many :comments
- has_many :purchaseis
- has_many :transactions



## Picturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|reference|null: false, foreign_key:true|

### Association
- belongs_to :item



## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false ,foreign_key:true|
|item_id|reference|null: false ,foreign_key:true|
|message|text|null: false|

### Association
- belongs_to :item
- belongs_to :user



## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|reference||

### Association
- belongs_to :parent
- has_many :items
- has_many :chirdren, foreign_key: :parent_id


## Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items



## Purchaseisテーブル

|Column|Type|Options|
|------|----|-------|
|sall_history|string|null: false|
|buy_history|string|null: false|
|status|enum|null: false|
|user_id|reference|null: false ,foreign_key:true|
|item_id|reference|null: false ,foreign_key:true|

### Association
- belongs_to :item
- belongs_to :user



## Evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|evaluation|string|null: false|
|user_id|reference|null: false,foreign_key:true|

### Association
- belongs_to :user