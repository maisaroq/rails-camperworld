class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  TYPE = ["van", "tent", "cooking supplies", "technology", "other"]

  validates :name, :price, presence: true
  validates :description, presence: :true, length: { minimum: 50 }
  validates :location, presence: true
  # validates :equipment_type, inclusion: { in: TYPE }
end
