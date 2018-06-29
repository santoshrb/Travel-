class ChangeColToSchemes < ActiveRecord::Migration
  def change
  	remove_column :schemes, :type, :string
  	 add_column :schemes, :scheme_type, :string
  end
end
