class CreateDocumentLists < ActiveRecord::Migration
  def change
    create_table :document_lists do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :document_master, index: true, foreign_key: true
      t.references :vehicle_booking, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
