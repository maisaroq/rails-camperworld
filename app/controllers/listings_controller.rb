class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:show]

  def index
     # refers to the listing_policy and resolce method
    @search = params["search"]
    if @search.present?
      @location = @search["location"]
      @listings = Listing.where(location: @location)
      @listings = Listing.where("location ILIKE ?", "%#{@location}%")
    end
    @listings = policy_scope(Listing)

    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude
      }
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      flash[:success] = "Listing successfully created"
      redirect_to listing_path(@listing)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @listing = Listing.find(params[:id]) # this should be done automatically though ?? ....
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :equipment_type, :location, :photo)
  end
end
