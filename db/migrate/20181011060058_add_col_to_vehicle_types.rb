class AddColToVehicleTypes < ActiveRecord::Migration
  def change
    add_column :vehicle_types, :brand, :string
  end
end
