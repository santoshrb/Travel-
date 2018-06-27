class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :code
      t.string :name
      t.text :address
      t.string :country
      t.string :state
      t.string :district
      t.string :city
      t.integer :pin_code
      t.string :email
      t.string :contact_no
      t.boolean :status

      t.timestamps
    end
  end
end
