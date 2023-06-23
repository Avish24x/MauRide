class AddImageToVehicules < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicules, :image, :string
  end
end
