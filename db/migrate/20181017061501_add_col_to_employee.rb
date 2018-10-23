class AddColToEmployee < ActiveRecord::Migration
  def change
  	add_reference :employees, :manager_1
    add_reference :employees, :manager_2
    add_reference :employees, :role, index: true, foreign_key: true
  end
end
