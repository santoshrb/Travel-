class AddColToVehicleBookings < ActiveRecord::Migration
  def change
    add_column :vehicle_bookings, :guarantor_unit, :string
    add_column :vehicle_bookings, :guarantor1_unit, :string
  end
end
