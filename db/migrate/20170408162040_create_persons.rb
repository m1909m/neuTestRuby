class CreatePersons < ActiveRecord::Migration
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
