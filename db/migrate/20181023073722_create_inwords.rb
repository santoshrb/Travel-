class CreateInwords < ActiveRecord::Migration
  def change
    create_table :inwords do |t|
      t.date :date
      t.references :vehicle_booking, index: true, foreign_key: true
      t.string :payment_type
      t.decimal :amount
      t.string :receipt_no
      t.references :employee, index: true, foreign_key: true
      t.string :vendor_name
      t.string :contact_no

      t.timestamps null: false
    end
  end
end
