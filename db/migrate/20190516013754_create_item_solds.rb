class CreateItemSolds < ActiveRecord::Migration[5.0]
  def change
    create_table :item_solds do |t|
      t.string :status,null: false#出品中の状態
    end
  end
end
