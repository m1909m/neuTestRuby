class AddVariableToCEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :c_events, :all_day_event, :boolean
  end
end
