class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.references :item , foreign_key:true
      t.integer :seller_id ,null: false
      t.integer :buyer_id ,null: false
    end
  end
end
