class ListingsController < ApplicationController
  def index
    @listings = policy_scope(Listing) # refers to the listing_policy and resolce method
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
  end

  def show
    @listing = Listing.find()
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :equipment_type, :image)
  end
end
