class CreateNewsContents < ActiveRecord::Migration[5.0]
  def change
    create_table :newscontents do |t|
      t.text :content
      t.boolean :send
      t.datetime :sendtime
      t.integer :newsletter_id
      t.timestamps
    end
  end
end
