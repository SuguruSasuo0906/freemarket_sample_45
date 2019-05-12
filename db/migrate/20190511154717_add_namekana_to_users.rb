class AddNamekanaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :namekana, :string, null: false
  end
end
