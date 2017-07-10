class ChangePass < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :pass, :password

  end
end