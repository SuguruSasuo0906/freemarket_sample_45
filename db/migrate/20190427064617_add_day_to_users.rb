class AddDayToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :day, :integer
  end
end
