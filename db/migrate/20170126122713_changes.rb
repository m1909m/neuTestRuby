class Changes < ActiveRecord::Migration[5.0]
  def change
    change_column :roomplanings, :monday, :datetime
    change_column :roomplanings, :tuesday, :datetime
    change_column :roomplanings, :wednesday, :datetime
    change_column :roomplanings, :thursday, :datetime
    change_column :roomplanings, :friday, :datetime
    change_column :events, :hours, :float
  end
end
