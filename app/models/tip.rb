class Tip < ApplicationRecord
  belongs_to :line
  belongs_to :user
end
