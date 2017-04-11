class AddSiteName < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :userMail, :string
  end
end
