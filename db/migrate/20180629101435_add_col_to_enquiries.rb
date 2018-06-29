class AddColToEnquiries < ActiveRecord::Migration
  def change
  	add_reference :enquiries, :scheme, foreign_key: true
  end
end
