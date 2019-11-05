class Type < ApplicationRecord
  has_many :beasts
  validates :name, presence: true, uniqueness: true
end
