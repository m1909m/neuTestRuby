class CreatePersons < ActiveRecord::Migration[5.0]
  def change
    create_table :persons do |t|
      t.string :name
      t.string :vorname
      t.string :einrichtung
      t.string :adresse
      t.string :ort
      t.string :email

      t.timestamps
    end
  end
end
