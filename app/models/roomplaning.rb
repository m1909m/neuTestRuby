class Roomplaning < ApplicationRecord
  has_one :events
  has_one :rooms
end
