class AddNametoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :address, :string
    add_column :users, :Referral, :string
  end
end