class Area < ApplicationRecord
  has_many :lines, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true

  include PgSearch::Model
  multisearchable against: [:name]
end
