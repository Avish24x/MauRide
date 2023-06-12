class CreateStartLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :start_locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.references :ride, null: false, foreign_key: true

      t.timestamps
    end
  end
end
