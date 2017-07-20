class AboNewsletter < ApplicationRecord
  #belongs_to :newsletter


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |abos|
        csv << abos.attributes.values_at(*column_names)
      end
    end
  end


end
