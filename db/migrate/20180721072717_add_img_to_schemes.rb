class AddImgToSchemes < ActiveRecord::Migration
  def change
    add_attachment :schemes, :image1
  end
end
