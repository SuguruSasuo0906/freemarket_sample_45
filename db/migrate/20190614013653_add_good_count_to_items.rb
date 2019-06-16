class AddGoodCountToItems < ActiveRecord::Migration[5.0]
  class MigrationUser < ApplicationRecord
    self.table_name = :items
  end

  def up
    _up
  rescue => e
    _down
    raise e
  end

  def down
    _down
  end

  private

  def _up
    MigrationUser.reset_column_information

    add_column :items, :good_count, :integer, null: false, default: 0 unless column_exists? :items, :good_count
  end

  def _down
    MigrationUser.reset_column_information

    remove_column :items, :good_count if column_exists? :items, :good_count
  end
end
