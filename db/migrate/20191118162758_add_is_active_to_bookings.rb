class AddIsActiveToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :is_active, :boolean, default: true
  end
end
