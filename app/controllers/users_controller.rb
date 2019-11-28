class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :users_listings, :users_requests]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  def users_listings
    @listings = @user.listings.all()
    # render json: @listings
    # render 'show.json.jbuilder'
    render 'index.json.jbuilder'
  end

  def users_requests
    @requests = @user.requests.all()
    listing_id_arr = []

    @requests.each do |request|
      listing_id_arr.push(request.listing_id)
    end

    @users_requested_listings = Listing.find(listing_id_arr)
    # render 'index.json.jbuilder'
    render 'requests.json.jbuilder'
  end


  # GET /users/1
  def show
    # example of querying for all listings associated with a user

    
    # @messages = @user.received_messages.all()
    # render json: @messages
    
    # @requests = @user.requests.all()
    # render json: @requests
    
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render json: @user, status: :created, location: @user
    else
      puts "HUGE ERROR"
      render json: @user.errors, status: :unprocessable_entity
    end
    # puts @user

  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
