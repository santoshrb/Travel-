class AddImageInSchemes < ActiveRecord::Migration
  def change
    add_attachment :schemes, :image2
    add_attachment :schemes, :image3
    add_attachment :schemes, :image4
    add_attachment :schemes, :image5
  end
end
