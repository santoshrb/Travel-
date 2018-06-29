class AddColToEnquiries < ActiveRecord::Migration[5.2]
  def change
  	add_reference :enquiries, :scheme, foreign_key: true
  end
end
