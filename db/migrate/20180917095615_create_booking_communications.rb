class CreateBookingCommunications < ActiveRecord::Migration
  def change
    create_table :booking_communications do |t|
      t.references :vehicle_booking, index: true, foreign_key: true
      t.string :variant
      t.string :vc_number
      t.string :quality
      t.string :company_name
      t.string :designation
      t.string :customer_po_no
      t.string :insurance
      t.string :registration
      t.string :delivery_location
      t.date :expected_delivery
      t.string :sales_person
      t.string :ex_showroom_price
      t.string :insurance_amount
      t.string :registration_amount
      t.string :accessories_vat_amount
      t.string :txtenaea_warranty_amount
      t.string :amc_amount
      t.string :exchange_amount
      t.string :exchange_discount
      t.string :logistics_charges
      t.string :corporate_offer
      t.string :taxes_levies
      t.string :tatoal_recevivable_amount
      t.string :finance_by
      t.string :finance_amount
      t.string :down_payment
      t.string :emi_amount
      t.string :car_model
      t.string :make
      t.string :year_of_manufacture
      t.string :varluation_amount
      t.text :special_insurance

      t.timestamps null: false
    end
  end
end
