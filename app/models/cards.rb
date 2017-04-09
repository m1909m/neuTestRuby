class Cards < ApplicationRecord

  belongs_to :person

  accepts_nested_attributes_for :person
end
