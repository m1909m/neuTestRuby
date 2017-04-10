class CreateBooking < ActiveRecord::Migration[5.0]
  def change
    create_table :booking do |t|
      t.integer :article_id
      t.integer :card_id

      t.timestamps
    end
  end
end
