class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  TYPE = ["Campervan", "Tent", "Cooker", "Technology", "Gear", "Survival Kit", "Backpack", "Other"]

  has_many :reservations

  validates :name, :price, :location, presence: true
  validates :description, presence: :true, length: { minimum: 10 }
  validates :equipment_type, presence: true, inclusion: { in: TYPE }
end
