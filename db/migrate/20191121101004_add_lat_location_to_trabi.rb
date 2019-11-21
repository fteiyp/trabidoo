class AddLatLocationToTrabi < ActiveRecord::Migration[5.2]
  def change
    add_column :trabis, :lat_location, :float
  end
end
