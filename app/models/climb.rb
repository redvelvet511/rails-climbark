class Climb < ApplicationRecord
  STATUSES = %w[completed attempted retreated]

  belongs_to :line
  belongs_to :user

  has_many_attached :photos

  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :description, presence: true, length: { minimum: 10 }
  validates :climb_date, presence: true
  validates_comparison_of :climb_date, less_than_or_equal_to: Date.today
end
