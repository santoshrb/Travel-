class AddColumnToScheme < ActiveRecord::Migration
  def change
    add_column :schemes, :emi_amount, :string
  end
end
