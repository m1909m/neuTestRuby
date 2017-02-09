class Room < ApplicationRecord
  belongs_to :roomplaning
  belongs_to :event
end
