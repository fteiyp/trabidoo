class RemoveStuffFromTrabis < ActiveRecord::Migration[5.2]
  def change
    remove_column :trabis, :address_location, :string
  end
end
