class CreateTrabis < ActiveRecord::Migration[5.2]
  def change
    create_table :trabis do |t|
      t.references :user, foreign_key: true
      t.string :color
      t.integer :year
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
