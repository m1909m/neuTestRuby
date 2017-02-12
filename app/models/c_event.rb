class CEvent < ApplicationRecord
  has_one :room
  accepts_nested_attributes_for :room

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
