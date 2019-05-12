class RenamePhoneNumberToPhonenumbers < ActiveRecord::Migration[5.0]
  def change
    rename_column :phonenumbers, :phone_number, :number
  end
end
