class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :trabi, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
