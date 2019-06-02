class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.binary :data, limit: 10.megabyte , null: false#画像データ
      t.references :item , foreign_key: true#商品のID
    end
  end
end
