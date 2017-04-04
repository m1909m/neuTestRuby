class CEvent < ApplicationRecord
  has_one :room
  belongs_to :member
  accepts_nested_attributes_for :member
  accepts_nested_attributes_for :room
  before_create :addRoomSize

  def addRoomSize
    room = Room.find(self.room_id)
    self.maxSize = room.size
  end

  def name_with_initial
    "#{title}"
  end

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def is_free?
    self.member <= self.maxSize ? 1 : 0
  end
end
