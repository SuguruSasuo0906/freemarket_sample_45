class AddNameToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :name, :string,null:false,default:""
    add_column :addresses, :namekana, :string,null:false,default:""
    add_reference :addresses, :prefecture, foreign_key: true
  end
end
