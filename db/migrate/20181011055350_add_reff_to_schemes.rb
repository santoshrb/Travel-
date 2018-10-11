class AddReffToSchemes < ActiveRecord::Migration
  def change
    add_reference :schemes, :branch, index: true, foreign_key: true
  end
end
