class CreateNewsContents < ActiveRecord::Migration[5.0]
  def change
    create_table :news_contents do |t|
      t.string :title
      t.text :content
      t.datetime :sendtime
      t.integer :newsletter_id

      t.timestamps
    end
  end
end
