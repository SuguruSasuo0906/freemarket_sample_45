class CreateItemStates < ActiveRecord::Migration[5.0]
  def change
    create_table :item_states do |t|
      t.string :status,null: false#商品の状態
    end
  end
end
