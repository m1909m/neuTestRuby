class NewsContent < ApplicationRecord
  include SearchCop

  search_scope :search do
    attributes :title, :content
  end
  has_one :newsletter

  validates :title, :content, :sendtime, :newsletter_id, presence: true
end
