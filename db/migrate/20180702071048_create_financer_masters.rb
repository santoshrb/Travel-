class CreateFinancerMasters < ActiveRecord::Migration
  def change
    create_table :financer_masters do |t|
      t.string :code
      t.string :name
      t.text :description
      t.integer :pin_code
      t.string :place
      t.text :address
      t.string :contact_no
      t.string :email
      t.string :contact_person
      t.boolean :status

      t.timestamps null: false
    end
  end
end
