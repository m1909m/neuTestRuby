class Member < ApplicationRecord
  has_one :c_event

  accepts_nested_attributes_for :c_event
  after_create :increment_member

  def increment_member
    c_event.member = c_event.member + 1

  end
end
