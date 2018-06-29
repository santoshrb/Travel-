class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :code
      t.string :prefix
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :contact_no
      t.string :email
      t.string :blood_group
      t.string :address
      t.string :country
      t.string :state
      t.string :district
      t.string :city
      t.integer :pin_code
      t.string :adhar_no
      t.boolean :status

      t.timestamps
    end
  end
end
