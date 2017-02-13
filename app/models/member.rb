class Member < ApplicationRecord
  has_one :c_event

  accepts_nested_attributes_for :c_event
  after_create :increment_member

  def increment_member
    c_event = CEvent.find(self.event_id)
    c_event.increment(:member)
    c_event.save
  end
end
