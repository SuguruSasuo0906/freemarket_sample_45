class CreatePhonenumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phonenumbers do |t|

      t.references :user , foreign_key:true
      t.string :number,null: false

      t.string :verification_code
      t.boolean :verified
  
      t.timestamps
    end
  end
end