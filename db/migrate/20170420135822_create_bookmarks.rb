class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.integer :link_id
      t.string :title
      t.text :notes

      t.timestamps
    end
  end
end
