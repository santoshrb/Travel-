class AddReffToVehicleBookings < ActiveRecord::Migration
  def change
    add_reference :vehicle_bookings, :executive
  end
end
