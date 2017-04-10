class Card < ApplicationRecord

  belongs_to :person

  has_many :bookings
  has_many :articles, through: :bookings

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :articles

end
