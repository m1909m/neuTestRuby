class ChangeSendName < ActiveRecord::Migration[5.0]
  def change
    rename_column :news_contents, :send, :sendStatus
  end
end
