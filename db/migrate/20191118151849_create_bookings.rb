class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :rating_review
      t.text :content_review
      t.references :user, foreign_key: true
      t.references :trabi, foreign_key: true

      t.timestamps
    end
  end
end
