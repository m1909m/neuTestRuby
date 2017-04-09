class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :person_id
      t.text :articles

      t.integer :price
      t.integer :count
      t.double :sum

      t.timestamps
    end
  end

end