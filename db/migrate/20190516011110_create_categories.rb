class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :type,null: false#カテゴリーの種類

      t.timestamps
    end
  end
end
