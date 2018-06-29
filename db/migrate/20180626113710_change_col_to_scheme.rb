class ChangeColToScheme < ActiveRecord::Migration
  def change
  	 remove_column :schemes, :installment, :decimal
  	 add_column :schemes, :installment_amount, :decimal
  end
end
