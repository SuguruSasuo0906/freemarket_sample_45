class CreateBlands < ActiveRecord::Migration[5.0]
  def change
    create_table :blands do |t|
      t.string :name,null: false,default: ""#商品のブランド名
    end
  end
end
