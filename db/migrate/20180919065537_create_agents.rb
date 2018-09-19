class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :middel_name
      t.string :last_name
      t.string :mobile_number
      t.boolean :status

      t.timestamps null: false
    end
  end
end
