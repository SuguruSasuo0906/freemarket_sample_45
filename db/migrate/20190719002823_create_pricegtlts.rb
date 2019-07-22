class CreatePricegtlts < ActiveRecord::Migration[5.0]
  def change
    create_table :pricegtlts do |t|

      t.string :gtlt#〜円以上〜円以下

      t.timestamps
    end
  end
end
