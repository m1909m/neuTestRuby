class ChangePassNew < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password, :passwordEncrypt

  end
end