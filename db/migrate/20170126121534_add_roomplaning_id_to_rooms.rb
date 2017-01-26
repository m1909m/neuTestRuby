class AddRoomplaningIdToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :roomplaning_id, :integer
  end
end
