class AddLonLocationToTrabi < ActiveRecord::Migration[5.2]
  def change
    add_column :trabis, :lon_location, :float
  end
end
