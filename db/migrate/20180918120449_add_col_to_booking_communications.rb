class AddColToBookingCommunications < ActiveRecord::Migration
  def change
    add_column :booking_communications, :accessories, :boolean
    add_column :booking_communications, :extended_warranty, :boolean
    add_column :booking_communications, :amc, :boolean
    add_column :booking_communications, :other, :boolean
    add_column :booking_communications, :other1, :boolean
  end
end
