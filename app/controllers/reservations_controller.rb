class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:index, :create, :show]

  def index
    @reservations = policy_scope(Reservation) # refers to the reservation_policy and resolce method
    # @search = params["search"]
    # if @search.present?
    #   @location = @search["location"]
    #   @reservations = Listing.where(location: @location)
    # end
  end

  def new
    @reservations = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # so the reservation has the same user as current_user, it's not authomatic
    @reservation.user = current_user
    # to pass "parameters" from current listing to the reservation listing parameters
    @reservation.listing = @listing

    if @reservation.save
      flash[:success] = "Reservation successfully created"
      # tis is path for the confirmation of reservation, takes both the listing and reservation
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id]) # fint the id of the listing
  end

  def reservation_params
    params.require(:reservation).permit(:starts_at, :ends_at)
  end
end
