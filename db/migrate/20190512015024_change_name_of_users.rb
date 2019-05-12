class ChangeNameOfUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_column :users, :name, :string,default: ""
    change_column :users, :namekana, :string,default:""
  end

  def self.down
    change_column :users, :name, :string,default: nil
    change_column :users, :namekana, :string,default:nil
  end
end
