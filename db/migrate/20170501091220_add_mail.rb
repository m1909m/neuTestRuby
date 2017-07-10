class AddRech < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :sendAccept, :boolean

  end
end