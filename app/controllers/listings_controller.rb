class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]

  # GET /listings
  def index   
    search = params[:search]
    if search
      @listings = Listing.where("lower(description) LIKE lower(:search) OR lower(title) LIKE lower(:search)", search: "%#{search}%")
    else 
      @listings = Listing.order(updated_at: :desc)
    end

    render 'index.json.jbuilder'
  end

  # def users_listings
  #   @listings = @user.listings.all()
  #   render json: @listings
  # end

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

    
    par = params[:pics]
    
    if par
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
    end
  
    render 'show.json.jbuilder'
    
  end

  # PATCH/PUT /listings/1
  def update
    # if @listing.update(params)
    if @listing.update(listing_params)
      # render json: @listing
      nil
    else
      render json: {"response": "no good"}
      # render json: @listing.errors, status: :unprocessable_entity
    end
    par = params[:pics]
    
    if par 
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
    end

    render 'show.json.jbuilder'
    
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
      params[:price_per_day] = params[:price_per_day].to_f.round(2) * 100
      params.permit(:title, :description, :user_id, :price_per_day, :availability)
      # params.permit(:title, :description, :user_id, :price_per_day, :availability, :id)
      # params.required(:listing).permit(:title, :description, :user_id, :price_per_day, :availability, pics: [])
    end
end
