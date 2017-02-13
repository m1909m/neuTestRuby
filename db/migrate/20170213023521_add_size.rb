class AddSize < ActiveRecord::Migration[5.0]
  def change
    add_column :c_events, :minSize, :integer
    add_column :c_events, :maxSize, :integer
    add_column :c_events, :member, :integer
    add_column :c_events, :free, :boolean

    add_column :rooms, :picture, :string
  end
end
