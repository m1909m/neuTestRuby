class Bookmark < ApplicationRecord
  belongs_to :link, :counter_cache => true

  attr_accessor :url
end
