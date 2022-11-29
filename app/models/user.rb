class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # geocoded_by :ip_address, latitude: :lat, longitude: :lon
  # after_validation :geocode

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :climbs, dependent: :destroy
  has_many :lines, through: :climbs
  has_many :tips, dependent: :destroy
  has_one_attached :photo # , default_url: "user_placeholder.jpg"

  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
end
