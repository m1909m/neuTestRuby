class AddEventIdToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :event_id, :integer
  end
end
