class Line < ApplicationRecord
  TYPES = %w[trad sport toprope]

  belongs_to :area
  has_many :climbs
  has_many :tips, dependent: :destroy

  validates :name, presence: true
  validates :grade, presence: true
  validates :type, presence: true
  validates :description, presence: true
end
