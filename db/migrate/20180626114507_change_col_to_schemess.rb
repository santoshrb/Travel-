class ChangeColToSchemess < ActiveRecord::Migration[5.2]
  def change
  	 add_column :schemes, :installment, :string
  end
end
