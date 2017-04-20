class Newsletter < ApplicationRecord
  #has_many :abo_newsletters
  belongs_to :news_content
  #Prüfung auf vorhandensein
  validates :from, :newsHeader, :newsBody, :newsFooter, presence: true

end
