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

    # render json: @listing

    # render 'show.json.jbuilder'

    
    #we don't need to return anything and when fetching the route show, do as http://localhost:3000/listings/4.json and it will render the jbuilder file I added 
    #or add render 'show.json.jbuilder' and fetch http://localhost:3000/listings/4 (withouth .json in the end)
    # DELETE this after reading!!!

    # @list = Listing.joins("INNER JOIN images ON images.listing_id = listings.id AND images.listing_id = '4'")

  end

  # POST /listings
  def create

    # new_params = {
    #   title: params[:title],
    #   user_id: params[:user_id],
    #   pics: [params[:pics]]
    # }
    @listing = Listing.new(listing_params)
    puts @listing

    #save the listing first to get the ID

    if @listing.save
      render json: @listing, status: :created, location: @listing
      # respond_to do |format|
      #   format.json { }
    else
      render json: @listing.errors, status: :unprocessable_entity
    end

    # puts @listing.user_id
    #do a block to loop over every image, upload to the cloud, get the link out of it and then add the info to the images table
    cloud = Cloudinary::Uploader.upload(params[:pics].tempfile.path)
    # puts cloud
    # puts cloud["secure_url"]
    # puts @listing.id

    #something like
    image_params = {
      url: cloud["secure_url"],
      listing_id: @listing.id
    }
    puts image_params
    @image = Image.new(image_params )

    if @image.save
      render json: @image, status: :created, location: @image
      # respond_to do |format|
      #   format.json { }
    else
      render json: @image.errors, status: :unprocessable_entity
    end

    #then return JSON? not sure...
    
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
      params.permit(:title, :description, :user_id, :price_per_day, :availability)
      # params.required(:listing).permit(:title, :description, :user_id, :price_per_day, :availability, pics: [])
    end
end
