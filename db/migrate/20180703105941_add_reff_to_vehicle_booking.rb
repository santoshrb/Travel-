class AddReffToVehicleBooking < ActiveRecord::Migration
  def change
    add_reference :vehicle_bookings, :enquiry, index: true, foreign_key: true
    add_reference :vehicle_bookings, :vehicle_type, index: true, foreign_key: true
  end
end
