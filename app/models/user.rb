class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :climbs, dependent: :destroy
  has_many :lines, through: :climbs
  has_many :tips, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
end
