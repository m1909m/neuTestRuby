class Newsletter < ApplicationRecord
  #has_many :abo_newsletters
  #Prüfung auf vorhandensein
  validates :from, :newsHeader, :newsBody, :newsFooter, presence: true

end
