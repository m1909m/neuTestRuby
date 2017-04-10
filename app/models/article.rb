class Article < ApplicationRecord

  has_many :bookings
  has_many :cards, through: :bookings

  accepts_nested_attributes_for :cards
end