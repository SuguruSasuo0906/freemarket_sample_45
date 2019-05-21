class CreatePrefectures < ActiveRecord::Migration[5.0]
  def change
    create_table :prefectures do |t|

      t.string :name,null: false
    end
  end
end
