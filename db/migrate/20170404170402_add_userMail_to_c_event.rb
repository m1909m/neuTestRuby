class AddUsermailToCEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :c_events, :userMail, :string
  end
end
