class Area < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  has_many :lines, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true

  include PgSearch::Model
  multisearchable against: [:name]
end
