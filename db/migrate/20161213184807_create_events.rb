class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :minSize
      t.integer :maxSize
      t.string :days
      t.string :hours
      t.integer :weeks
      t.date :startDate
      t.date :endDate
      t.datetime :startLoginDate
      t.datetime :endLoginDate

      t.timestamps
    end
  end
end
