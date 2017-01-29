class Roomplaning < ApplicationRecord
  has_one :event
  has_one :room
end
