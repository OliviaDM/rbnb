class Review < ApplicationRecord
  belongs_to :booking
  validates :booking_id, presence: true
  validates :sucker_content, :beast_content, length: {
    in: 20..200,
    too_short: "The review should be more than 20 characters, other users will appreciate it!",
    too_long: "The review should be less than 200 characters,
    try to be concise!"
  }
  validates :sucker_rating, :beast_rating, inclusion: { in: [0..5], message: "The rating should between 0 and 5" }
end
