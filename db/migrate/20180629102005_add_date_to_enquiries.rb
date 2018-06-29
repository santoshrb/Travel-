class AddDateToEnquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :enquiries, :enquiry_date, :date
  end
end
