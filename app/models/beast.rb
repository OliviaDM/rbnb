class Beast < ApplicationRecord
  belongs_to :sucker
  belongs_to :type
  has_many :bookings, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :sucker_id, :type_id, presence: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: false, greater_than: 0 }
  validates :description, presence: true, length: {
    in: 20..200,
    too_short: "The description should be longer than 20 characters,
    a more accurate description improves the booking rate of your beast!",
    too_long: "The description should be less than 200 characters,
    try to be concise as it will improve the booking rate of your beast!"
  }

  geocoded_by :region
  after_validation :geocode, if: :will_save_change_to_region?
end
