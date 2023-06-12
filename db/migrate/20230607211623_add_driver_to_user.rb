class AddDriverToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :account_status
    add_column :users, :driver, :boolean
  end
end
