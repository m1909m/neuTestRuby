class AddRechnung < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :nameR, :string
    add_column :people, :vornameR, :string
    add_column :people, :einrichtungR, :string
    add_column :people, :adresseR, :string
    add_column :people, :ortR, :string
    add_column :people, :emailR, :string
  end
end
