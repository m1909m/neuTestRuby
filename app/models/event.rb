class Event < ApplicationRecord
#  has_many :reservations
  belongs_to :roomplaning
  accepts_nested_attributes_for :roomplaning
end
