class AddCityAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city_address, :string
  end
end
