class AddReferenceToVehicleBooking < ActiveRecord::Migration
  def change
    add_reference :vehicle_bookings, :agent, index: true, foreign_key: true
  end
end
