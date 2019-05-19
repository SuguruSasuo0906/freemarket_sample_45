class RemoveCreatedAtFromPrefectures < ActiveRecord::Migration[5.0]
  def up
    remove_column :prefectures, :created_at, :string
  end

  def down
    add_column :prefectures, :created_at, :string
  end
end
