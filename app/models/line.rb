class Line < ApplicationRecord
  CATEGORIES = %w[trad sport toprope]
  GRADES_LIST = %w[5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 5.10a 5.10b 5.10c 5.10d 5.11a 5.11b 5.11c 5.11d 5.12a 5.12b 5.12c 5.12d 5.13a 5.13b 5.13c 5.13d 5.14a 5.14b 5.14c 5.14d 5.15a 5.15b 5.15c 5.15d]

  belongs_to :area
  has_many :climbs
  has_many :users, through: :climbs
  has_many :tips, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :grade, presence: true, inclusion: { in: GRADES_LIST }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :description, presence: true

  include PgSearch::Model
  multisearchable against: %i[name category grade]

  def self.highest_grade(lines)
    grades_index = []
    lines.each { |line| grades_index << GRADES_LIST.index(line.grade) }
    grades_index.empty? ? nil : GRADES_LIST[grades_index.max]
  end
end
