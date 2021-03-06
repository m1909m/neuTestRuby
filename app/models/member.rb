class Member < ApplicationRecord



  has_one :c_event



  accepts_nested_attributes_for :c_event

  after_create :increment_member



  def increment_member

    c_event = CEvent.find(self.event_id)

    c_event.increment(:member)

    if c_event.member >= c_event.maxSize
      c_event.free = 0

    end

    c_event.save

  end



  def self.to_csv(options = {})

    CSV.generate(options) do |csv|

      csv << column_names

      all.each do |members|

        csv << members.attributes.values_at(*column_names)

      end

    end

  end

end

