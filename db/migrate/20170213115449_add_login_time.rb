class AddLoginTime < ActiveRecord::Migration[5.0]
  def change
    add_column :c_events, :startLogin, :datetime
    add_column :c_events, :endLogin, :datetime
    
    add_column :newsletters, :default, :boolean

    add_column :newssystems, :send, :boolean
    add_column :newssystems, :sendDate, :datetime
  end
end
