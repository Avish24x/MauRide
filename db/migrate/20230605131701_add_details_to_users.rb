class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :location, :text
    add_column :users, :phone_number, :string
    add_column :users, :payment_details, :string
    add_column :users, :rating, :integer
    add_column :users, :account_status, :string
  end
end
