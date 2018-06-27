class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :code
      t.string :name
      t.text :address
      t.string :email
      t.string :contact_no
      t.boolean :status

      t.timestamps
    end
  end
end
