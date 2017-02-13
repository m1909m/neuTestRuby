class Event < ApplicationRecord
#  has_many :reservations
  belongs_to :roomplaning
  has_one :room
  accepts_nested_attributes_for :roomplaning
end
