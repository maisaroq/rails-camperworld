class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  TYPE = ["Van", "Tent", "Cooker", "Technology", "Survival Kit", "Backpack", "Other"]

  has_many :reservations

  validates :name, :price, presence: true
  validates :description, presence: :true, length: { minimum: 10 }
  validates :location, presence: true
  validates :equipment_type, inclusion: { in: TYPE }
end
