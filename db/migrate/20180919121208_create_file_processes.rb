class CreateFileProcesses < ActiveRecord::Migration
  def change
    create_table :file_processes do |t|
      t.references :vehicle_booking, index: true, foreign_key: true
      t.string :financer
      t.string :contact_person
      t.string :contact_no
      t.string :status

      t.timestamps null: false
    end
  end
end
