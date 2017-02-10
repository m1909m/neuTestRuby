class CreateCEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :c_events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color
      t.text :description

      t.timestamps
    end
    add_column :c_events, :room_id, :integer
  end
end
