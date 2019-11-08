class Photo < ApplicationRecord
  belongs_to :beast
  mount_uploader :photo, PhotoUploader
  validates :beast_id, :photo, presence: true # Not sure if this is the way to validate for a photo,
  # might have to come back to this later
end
