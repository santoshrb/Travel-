class AddColInEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :status, :string
  end
end
