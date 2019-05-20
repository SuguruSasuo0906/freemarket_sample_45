class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name,null: false#画像名
      t.references :item , foreign_key: true#商品のID
    end
  end
end
