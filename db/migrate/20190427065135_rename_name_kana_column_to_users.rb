class RenameNameKanaColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users,:name_kana,:first_name_kana
  end
end
