class CreateEnquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :enquiries do |t|
      t.string :mobile_no
      t.string :name_first
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.text :address
      t.string :place
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
