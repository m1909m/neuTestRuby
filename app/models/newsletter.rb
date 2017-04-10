class Newsletter < ApplicationRecord
  #has_many :abo_newsletters
  belongs_to :newscontent
  #Prüfung auf vorhandensein
  validates :from, :newsHeader, :newsBody, :newsFooter, presence: true

end
