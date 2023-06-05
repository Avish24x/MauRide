class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.text :start_location
      t.text :end_location
      t.text :ride_details
      t.decimal :distance
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :price

      t.timestamps
    end
  end
end
