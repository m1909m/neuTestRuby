class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resume do |t|
      t.string :name
      t.string :attachment
      t.string :email

      t.timestamps
    end
  end
end
