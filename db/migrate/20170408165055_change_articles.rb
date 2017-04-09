class ChangeArticles < ActiveRecord::Migration
  def change
    change_column :cards, :articles, :text, array: true, default: [], using: "(string_to_array(articles, ','))"
  end
end
