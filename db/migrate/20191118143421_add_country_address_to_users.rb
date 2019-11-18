class AddCountryAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country_address, :string
  end
end
