class ChangeColToSchemess < ActiveRecord::Migration
  def change
  	 add_column :schemes, :installment, :string
  end
end
