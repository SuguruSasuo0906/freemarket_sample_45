class AddLastNameKanaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name_kana, :string
  end
end