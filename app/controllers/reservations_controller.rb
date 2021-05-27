class ReservationsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_reservation, only: [:show]

    def index
      @listing = Listing.find(params[:listing_id])
      @reservations = policy_scope(Reservation) # refers to the reservation_policy and resolce method
      # @search = params["search"]
      # if @search.present?
      #   @location = @search["location"]
      #   @reservations = Listing.where(location: @location)
      # end
    end

    def new
      @reservations = Reservation.new
      # @reservation.date = Time.now # set this to current date
    end

    def create
      @reservation = Reservation.new #(reservation_params)
      # @reservation.date = Time.now # set this to current date
      if @reservation.save
        flash[:success] = "Reservation successfully created"
        redirect_to reservation_path(@reservation)
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end

    def show
    end

    private

    def set_listing # correct?
      # @listing = Listing.find(params[:listing_id]) # fint hte id of the listing
    end

    # we dont need this since it's alredy ensure for the listings right?
    # or setup some other parameters we want?

    # def reservation_params
    #   params.require(:reservation).permit(:name, :description, :price, :equipment_type, :location, :image)
    # end

end
