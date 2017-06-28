class AddRech < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :nameR, :string
    add_column :members, :vornameR, :string
    add_column :members, :einrichtungR, :string
    add_column :members, :adresseR, :string
    add_column :members, :ortR, :string
    add_column :members, :emailR, :string

  end
end