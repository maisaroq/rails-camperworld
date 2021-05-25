class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]
  
  def index
    @listings = Listing.all
  end
  

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
  end
  
  def show
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :equipment_type, :image)
  end
end
