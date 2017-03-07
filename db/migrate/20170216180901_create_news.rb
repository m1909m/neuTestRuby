class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :subTitle
      t.text :story
      t.datetime :sendDate

      t.timestamps
    end
  end
end
