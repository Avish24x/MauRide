class AddTitleToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :title, :string
  end
end
