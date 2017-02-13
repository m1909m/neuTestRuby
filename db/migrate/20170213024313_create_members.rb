class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :gender
      t.string :firstName
      t.string :lastName
      t.string :street
      t.string :plz
      t.string :place
      t.string :job
      t.string :phone
      t.string :eMail
      t.boolean :sleep
      t.string :room
      t.string :nameCompany
      t.string :streetCompany
      t.string :placeCompany
      t.boolean :veggie
      t.boolean :accept
      t.integer :event_id

      t.timestamps
    end
  end
end
