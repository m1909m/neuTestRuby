class CEvent < ApplicationRecord
  has_one :room
  accepts_nested_attributes_for :room
  belongs_to :member

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def is_free?
    self.member <= self.maxSize ? true : false
  end
end
