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
    # @listing_images = @listing.pics
    # render json: @listing_images

    render json: @listing
  end

  # POST /listings
  def create
    new_params = {
      title: params[:title],
      user_id: params[:user_id],
      pics: [params[:pics]]
    }
    @listing = Listing.new(new_params)

    if @listing.save
      render json: @listing, status: :created, location: @listing
      # respond_to do |format|
      #   format.json { }
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /listings/1
  def update
    # params = {
    #   title: params[:title],
    #   user_id: params[:user_id],
    #   pics: [params[:pics]]
    # }
    # if @listing.update(params)
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: {"response": "no good"}
      # render json: @listing.errors, status: :unprocessable_entity
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
      params.permit(:title, :description, :user_id, :price_per_day, :availability, pics: [])
      # params.required(:listing).permit(:title, :description, :user_id, :price_per_day, :availability, pics: [])
    end
end
