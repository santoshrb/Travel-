class AddReffToUser < ActiveRecord::Migration
  def change
    remove_column :users, :role
    add_reference :users, :role, index: true, foreign_key: true
  end
end
