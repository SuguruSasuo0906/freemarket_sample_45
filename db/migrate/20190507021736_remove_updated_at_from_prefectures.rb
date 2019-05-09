class RemoveUpdatedAtFromPrefectures < ActiveRecord::Migration[5.0]
  def up
    remove_column :prefectures, :updated_at, :string
  end

  def down
    add_column :prefectures, :updated_at, :string
  end
end
