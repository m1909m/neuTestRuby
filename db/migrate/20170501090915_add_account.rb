class AddAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :c_events, :accountName, :string

  end
end
