class Room < ApplicationRecord
  belongs_to :c_event
  validates :number, presence: true
  validates :building, presence: true

end
