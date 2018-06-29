class AddRefrenceToSchema < ActiveRecord::Migration
  def change
  	add_reference :schemes, :vehicle_type, foreign_key: true
    add_reference :enquiries, :vehicle_type, foreign_key: true
  end
end
