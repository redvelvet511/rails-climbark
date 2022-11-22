class Tip < ApplicationRecord
  belongs_to :line
  belongs_to :user

  validates :content, presence: true
end
