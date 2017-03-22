class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :restaurants, :phonenumber, :phone_number
    change_column :restaurants, :phone_number, :strings
  end
end
