class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]

  # GET /listings
  def index
    @listings = Listing.all

    render json: @listings
  end

  # GET /listings/1
  def show
    # @listing_requests = @listing.requests.all()
    # render json: @listing_requests

    render json: @listing
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render json: @listing, status: :created, location: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(:title, :description, :user_id, :price_per_day, :availability)
    end
end
