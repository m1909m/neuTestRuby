class EventChanges < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :publish, :boolean
  end
end
