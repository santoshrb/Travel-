class ChangeColToSchemes < ActiveRecord::Migration[5.2]
  def change
  	remove_column :schemes, :type, :string
  	 add_column :schemes, :scheme_type, :string
  end
end
