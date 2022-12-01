class Tip < ApplicationRecord
  belongs_to :line
  belongs_to :user

  validates :title, length: { maximum: 30 }
  validates :content, presence: true, length: { minimum: 10 }
end
