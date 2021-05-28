class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index

     # refers to the listing_policy and resolce method
    @user = current_user

    @listings = policy_scope(Listing)

    @search = params["search"]
    if @search.present?
      @location = @search["location"]
      @listings = @listings.where("location ILIKE ?", "%#{@location}%")
    end

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

    @listing_user = @listing.user
    @reservation = Reservation.new

  end


  def edit

    authorize @listing
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit
    end
    authorize @listing
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  def my_listings
    @listings = Listing.where(user_id: current_user)
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :equipment_type, :location, :photo)
  end
end
