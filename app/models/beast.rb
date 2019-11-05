class Beast < ApplicationRecord
  belongs_to :sucker
  belongs_to :type
  has_many :photos
  has_many :bookings
  has_many :reviews, through: :bookings
end
