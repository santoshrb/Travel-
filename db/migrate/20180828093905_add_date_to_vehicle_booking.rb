class AddDateToVehicleBooking < ActiveRecord::Migration
  def change
    add_column :vehicle_bookings, :date, :date
  end
end
