class AddDates < ActiveRecord::Migration[5.0]
  def change
    add_column :c_events, :startSecond, :datetime
    add_column :c_events, :endSecond, :datetime
    add_column :c_events, :startThird, :datetime
    add_column :c_events, :endThird, :datetime
  end
end
