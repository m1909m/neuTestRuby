class Card < ApplicationRecord

  belongs_to :person
 # has_many :articles

  accepts_nested_attributes_for :person
 # accepts_nested_attributes_for :articles

end
