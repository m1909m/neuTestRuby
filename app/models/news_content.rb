class NewsContent < ApplicationRecord
  has_one :newsletter

  validates :title, :content, :sendtime, :newsletter_id, presence: true
end
