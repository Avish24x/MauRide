class CreateVehicules < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicules do |t|
      t.string :model
      t.text :registration_detail
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
