class Area < ApplicationRecord
  has_many :lines, dependent: :destroy

  validates :name, presence: true

  include PgSearch::Model
  multisearchable against: [:name]
end
