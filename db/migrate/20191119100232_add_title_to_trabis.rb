class AddTitleToTrabis < ActiveRecord::Migration[5.2]
  def change
    add_column :trabis, :title, :string
  end
end
