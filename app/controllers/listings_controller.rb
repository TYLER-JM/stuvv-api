class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]

  # GET /listings
  def index
    @listings = Listing.all
    render 'index.json.jbuilder'
  end

  # GET /listings/1
  def show
    render 'show.json.jbuilder'
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)
    #save the listing first to get the ID

    if @listing.save
      # render json: @listing, status: :created, location: @listing
      nil
    else
      render json: @listing.errors, status: :unprocessable_entity
    end

    #do a block to loop over every image, upload to the cloud, get the link out of it and then add the info to the images table
    par = params[:pics]
    
    par.each do |pic|
      cloud = Cloudinary::Uploader.upload(pic.tempfile.path)
      
      image_params = {
        url: cloud["secure_url"],
        listing_id: @listing.id
      }
      
      @image = Image.new(image_params)

      if @image.save
        nil
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end
  
    render 'show.json.jbuilder'
    
  end

  # PATCH/PUT /listings/1
  def update
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
      params.permit(:title, :description, :user_id, :price_per_day, :availability)
      # params.required(:listing).permit(:title, :description, :user_id, :price_per_day, :availability, pics: [])
    end
end
