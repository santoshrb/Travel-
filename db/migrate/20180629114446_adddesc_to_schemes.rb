class AdddescToSchemes < ActiveRecord::Migration
  def change
    add_column :schemes, :description, :text
  end
end
