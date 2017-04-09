class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :person_id
      t.text :articles

      t.integer :price
      t.integer :count
      t.decimal :sum

      t.timestamps
    end
  end

end