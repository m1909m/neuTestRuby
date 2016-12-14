class CreateAboNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :abo_newsletters do |t|
      t.string :eMail
      t.boolean :enable
      #t.references :newsletter, foreign_key: true

      t.timestamps
    end

  end
end
