class ChangeColToScheme < ActiveRecord::Migration[5.2]
  def change
  	 remove_column :schemes, :installment, :decimal
  	 add_column :schemes, :installment_amount, :decimal
  end
end
