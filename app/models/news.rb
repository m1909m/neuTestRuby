class News < ApplicationRecord
  searchable do
    text :title, :default_boost => 2
    test :story
  end
end
