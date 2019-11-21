class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
     rename_column :trabis, :lat_location, :latitude
     rename_column :trabis, :lon_location, :longitude
     rename_column :trabis, :location, :address
  end
end
