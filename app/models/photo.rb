class Photo < ApplicationRecord
  belongs_to :beast
  validates :beast_id, :photo, presence: true
end
