class ChangeArticles < ActiveRecord::Migration[5.0]
  def change
    change_column :cards, :articles, :text, array: true, default: [], using: "(string_to_array(articles, ','))"
  end
end
