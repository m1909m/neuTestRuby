class CreateRoomplanings < ActiveRecord::Migration[5.0]
  def change
    create_table :roomplanings do |t|
      t.integer :week
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday

      t.timestamps
    end
  end
end
