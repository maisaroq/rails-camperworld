class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:show]

  def index
     # refers to the listing_policy and resolce method
    @search = params["search"]
    byebug
    if @search.present?
      @location = @search["location"]
      @listings = Listing.where(location: @location)
      @listings = Listing.where("location ILIKE ?", "%#{@location}%")
    end
    @listings = policy_scope(Listing)
  end

  # def search
  #   # q means query
  #   # so the name of the location can be anywhere in the provided location
  #   @listings = Listing.where("location LIKE ?", "%" + params[:q] + "%")
  # end

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
