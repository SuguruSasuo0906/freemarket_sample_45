class AddPricegtltIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :pricegtlt, foreign_key: true
  end
end
