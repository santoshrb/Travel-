class AddDateToEnquiries < ActiveRecord::Migration
  def change
    add_column :enquiries, :enquiry_date, :date
  end
end
