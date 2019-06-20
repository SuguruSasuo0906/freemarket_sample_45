class RemoveStringFromUsers < ActiveRecord::Migration[5.0]

  def up
    remove_column :users, :string, :string
    remove_column :users, :integer, :integer

  end

  def down
    add_column :users, :string, :string
    add_column :users, :integer, :integer
  end
end
