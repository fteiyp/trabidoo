class AddIsActiveToTrabis < ActiveRecord::Migration[5.2]
   def change
     add_column :trabis, :is_active, :boolean, default: true
   end
 end
