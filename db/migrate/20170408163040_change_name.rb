class ChangeName< ActiveRecord::Migration[5.0]
  def changes
    rename_table :person, :people
  end
end
