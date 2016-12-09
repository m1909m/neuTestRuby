class CreateNewssystems < ActiveRecord::Migration[5.0]
  def change
    create_table :newssystems do |t|
      t.string :title
      t.string :subTitle
      t.text :story
      t.createNews :date
      t.timestamps
    end
  end
end
