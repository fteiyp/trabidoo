class AddAddressLocationToTrabi < ActiveRecord::Migration[5.2]
  def change
    add_column :trabis, :address_location, :string
  end
end
