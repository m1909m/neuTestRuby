class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :accountName
      t.integer :resume_id


      t.timestamps
    end
  end
end
