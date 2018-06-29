class AddReffToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :company, foreign_key: true
    add_reference :employees, :branch, foreign_key: true
    add_reference :branches, :company, foreign_key: true
    add_column :users, :role, :string
  end
end
