class AddNamekanaToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :namekana, :string,null:false,default:""
  end
end
