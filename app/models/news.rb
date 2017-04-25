class News < ApplicationRecord
  include SearchCop

  search_scope :search do
    attributes :title, :story
  end
end
