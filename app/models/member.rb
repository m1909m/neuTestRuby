class Member < ApplicationRecord
  has_one :c_event

  accepts_nested_attributes_for :c_event
end
