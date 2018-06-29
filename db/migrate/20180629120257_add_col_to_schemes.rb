class AddColToSchemes < ActiveRecord::Migration
  def change
  	add_attachment :schemes, :avatar
  	add_attachment :schemes, :image
  end
end
