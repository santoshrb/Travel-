class AddColToSchemes < ActiveRecord::Migration
  def change
  	add_attachment :schemes , :avatar
  end
end
