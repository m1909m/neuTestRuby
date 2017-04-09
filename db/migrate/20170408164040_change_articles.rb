class ChangeArticles < ActiveRecord::Migration[5.0]
  def changes
    change_column :cards, :articles, array: true
  end
end
