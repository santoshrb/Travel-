class CreateSchemes < ActiveRecord::Migration
  def change
    create_table :schemes do |t|
      t.string :type
      t.string :name
      t.decimal :budget
      t.string :down_payment
      t.string :installment
      t.decimal :installment
      t.decimal :intrest
      t.date :from_date
      t.date :to_date
      t.boolean :status

      t.timestamps
    end
  end
end
