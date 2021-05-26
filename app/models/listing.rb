class Listing < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image

  validates :name, :price, presence: true
  validates :description, presence: :true, length: { minimum: 50 }
end
