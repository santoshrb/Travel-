class CreateOutwords < ActiveRecord::Migration
  def change
    create_table :outwords do |t|
      t.date :date
      t.references :employee, index: true, foreign_key: true
      t.decimal :amount
      t.string :handover_to
      t.references :handover_id
      t.text :purpose

      t.timestamps null: false
    end
  end
end
