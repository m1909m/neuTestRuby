class Card < ApplicationRecord

  belongs_to :person

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :article

end
