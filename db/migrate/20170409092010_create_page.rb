class CreatePage < ActiveRecord::Migration[5.0]
  def change
    create_table :page do |t|
      t.text :content
      t.string :for
      t.boolean :accept

      t.timestamps
    end
  end
end
