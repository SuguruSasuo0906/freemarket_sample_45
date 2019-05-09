class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user , foreign_key:true
      t.string :postal_code,null: false,default: ""
      t.string :city,              null: false,default: ""
      t.string :block_number, null: false,default: ""
      t.string :building_name
      t.string :phone_number,null: false

      t.timestamps
    end
  end
end
