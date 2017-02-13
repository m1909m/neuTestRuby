class CEvent < ApplicationRecord
  has_one :room
  accepts_nested_attributes_for :room


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
