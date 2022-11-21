class Line < ApplicationRecord
  CATEGORIES = %w[trad sport toprope]

  belongs_to :area
  has_many :climbs
  has_many :tips, dependent: :destroy

  validates :name, presence: true
  validates :grade, presence: true, inclusion: { in: GRADES_LIST }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :description, presence: true
end
