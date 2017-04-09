class ChangeArticles < ActiveRecord::Migration
  def changes
    change_column :cards, :articles, :text, array: true, default: [], using: "(string_to_array(articles, ','))"
  end
end
