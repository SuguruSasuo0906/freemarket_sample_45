class AddColumnPhonenumbers < ActiveRecord::Migration[5.0]
  def change
    add_column :phonenumbers, :verification_code,:string
    add_column :phonenumbers, :verified,:boolean
  end
end
