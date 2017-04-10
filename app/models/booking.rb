class Booking < ApplicationRecord
  belongs_to :article
  belongs_to :card
end