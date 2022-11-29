class Area < ApplicationRecord
  has_many :lines, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  include PgSearch::Model
  multisearchable against: [:name]
end
