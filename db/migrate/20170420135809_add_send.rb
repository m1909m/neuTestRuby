class AddSend < ActiveRecord::Migration[5.0]
  def change
    add_column :news_contents, :send, :boolean
  end
end
