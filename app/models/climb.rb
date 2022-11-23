class Climb < ApplicationRecord
  STATUSES = %w[completed attempted retreated]

  belongs_to :line
  belongs_to :user

  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :description, presence: true, length: { minimum: 10 }
  validates_comparison_of :completion_date, less_than_or_equal_to: Date.today
end
