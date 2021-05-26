class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:show]

  def index
    @listings = policy_scope(Listing) # refers to the listing_policy and resolce method
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
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :equipment_type, :location, :image)
  end
end
