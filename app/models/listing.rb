class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  TYPE = ["Van", "Tent", "Cooker", "Technology", "Survival Kit", "Backpack", "Other"]

  has_many :reservations

  validates :name, :price, presence: true
  validates :description, presence: :true, length: { minimum: 10 }
  validates :location, presence: true
  validates :equipment_type, inclusion: { in: TYPE }
end
