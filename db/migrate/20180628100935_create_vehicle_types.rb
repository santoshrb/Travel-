class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
