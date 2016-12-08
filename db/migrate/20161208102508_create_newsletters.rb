class CreateNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletters do |t|
      t.string :from
      t.string :to
      t.string :type
      t.text :newsHeader
      t.text :newsBody
      t.text :newsFooter
      t.text :appendix

      t.timestamps
    end
  end
end
