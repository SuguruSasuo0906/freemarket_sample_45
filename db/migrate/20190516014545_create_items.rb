class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,null: false#商品名
      t.string :image,null: false#商品の画像
      t.text :description,null: false#商品の説明
      t.string :feewho,null: false#配送料の負担
      t.string :shipmentday,null: false#発送までの日数
      t.string :howdelivery,null: false#配送の方法
      t.string :size#商品のサイズ

      t.integer :price,null: false#価格

      t.references :user , foreign_key: true#ユーザーのID
      t.references :prefecture , foreign_key: true#地域のID
      t.references :category , foreign_key: true#商品のカテゴリーID
      t.references :item_sold , foreign_key: true#出品中かどうかのID
      t.references :item_state,foreign_key: true#商品の状態
      t.references :bland,foreign_key: true#ブランド名

      t.timestamps
    end

  end
end
