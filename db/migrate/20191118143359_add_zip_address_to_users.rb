class AddZipAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :zip_address, :string
  end
end
