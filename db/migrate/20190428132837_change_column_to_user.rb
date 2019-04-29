class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def up
    change_column :users,:payment,:string,null:false,default:""
    change_column :users,:transfer,:string,null:false,default:""
  end

  def down
    change_column :users,:payment,:string,null: false
    change_column :users,:transfer,:string,null: false
  end
end
