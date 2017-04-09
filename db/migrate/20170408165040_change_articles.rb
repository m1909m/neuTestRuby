class ChangeArticles < ActiveRecord::Migration
  def changes
    change_column :cards, :articles, array: true
  end
end
