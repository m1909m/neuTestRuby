class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.decimal :price
      t.integer :count
      t.string :site

      t.timestamps
    end
  end
end
