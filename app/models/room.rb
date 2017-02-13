class Room < ApplicationRecord
  belongs_to :roomplaning
  belongs_to :c_event
end
