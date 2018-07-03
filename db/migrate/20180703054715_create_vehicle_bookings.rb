class CreateVehicleBookings < ActiveRecord::Migration
  def change
    create_table :vehicle_bookings do |t|
      t.string :pan
      t.string :adhar
      t.string :licence
      t.string :light_bill
      t.string :rent_agr
      t.string :bs
      t.string :itr
      t.string :native_light_bill
      t.string :pan_guarantor
      t.string :adhar_guarantor
      t.string :light_bill_guarantor
      t.string :rent_agr_guarantor
      t.string :bs_guarantor
      t.string :itr_guarantor
      t.string :pan_guarantor1
      t.string :adhar_guarantor1
      t.string :light_bill_guarantor1
      t.string :rent_agr_guarantor1
      t.string :bs_guarantor1
      t.string :itr_guarantor1
      t.boolean :status

      t.timestamps null: false
    end
  end
end
