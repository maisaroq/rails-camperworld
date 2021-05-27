class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :reservations

  validates :name, :price, presence: true
  validates :description, presence: :true, length: { minimum: 50 }
  validates :location, presence: true
end
