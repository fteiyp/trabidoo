class AddStreetAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :street_address, :string
  end
end
