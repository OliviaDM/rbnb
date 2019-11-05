class Booking < ApplicationRecord
  belongs_to :sucker
  belongs_to :beast
  has_one :review
end
