class Booking < ApplicationRecord
  belongs_to :sucker
  belongs_to :beast
  has_one :review
  validates :sucker_id, :beast_id, :start_date, :end_date, presence: true
end
