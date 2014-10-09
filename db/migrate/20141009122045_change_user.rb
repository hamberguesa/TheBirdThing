class ChangeUser < ActiveRecord::Migration
  def change
    remove_column :users, :password, :string
    add_column :users, :password_hash, :string
  end
end
