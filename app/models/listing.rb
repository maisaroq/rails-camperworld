class Listing < ApplicationRecord
  belongs_to :user

  validates :name, :price, presence: true
  validates :description, presence: :true, length: { minimum: 50 }
end
