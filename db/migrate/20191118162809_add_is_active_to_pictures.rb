class AddIsActiveToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :is_active, :boolean, default: true
  end
end
