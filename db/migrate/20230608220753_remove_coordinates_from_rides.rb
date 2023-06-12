class RemoveCoordinatesFromRides < ActiveRecord::Migration[7.0]
  def change
    remove_column :rides, :longitude, :float
    remove_column :rides, :latitude, :float
  end
end
