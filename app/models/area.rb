class Area < ApplicationRecord
  has_many :lines, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
end
