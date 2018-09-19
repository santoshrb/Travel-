class AddReferenceToShowroomMaster < ActiveRecord::Migration
  def change
    add_reference :showroom_masters, :branch, index: true, foreign_key: true
    add_reference :financer_masters, :branch, index: true, foreign_key: true
  end
end
