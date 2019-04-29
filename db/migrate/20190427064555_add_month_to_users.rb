class AddMonthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :month, :integer
  end
end
