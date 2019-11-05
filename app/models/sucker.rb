class Sucker < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :beasts
  has_many :reviews, through: :bookings
end
