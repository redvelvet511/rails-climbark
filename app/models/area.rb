class Area < ApplicationRecord
  has_many :lines, dependent: :destroy

  validates :name, presence: true
end
