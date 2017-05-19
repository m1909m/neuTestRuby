class AddPass < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pass, :string
    add_column :users, :key, :string
    add_column :users, :salt, :string

  end
end