class AddRoomplaningIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :roomplaning_id, :integer
  end
end
