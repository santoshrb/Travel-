class AddColToScheme < ActiveRecord::Migration
  def change
    add_column :schemes, :interest, :string
    add_column :schemes, :total_amount, :string
  end
end
