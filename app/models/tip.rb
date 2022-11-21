class Tip < ApplicationRecord
  belongs_to :route
  belongs_to :user
end
