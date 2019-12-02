class RequestsController < ApplicationController
  before_action :set_request, only: [:update, :destroy]

  # GET /requests
  def index
    @requests = Request.all

    render json: @requests
  end

  # GET /requests/1
  # GET requests associated with a  with a single listing
  def show
    
    @all_listing_requsts = Request.where(listing_id: params[:id])
    render json: @all_listing_requsts
  end

  def show_approved
    @all_listing_approved_requests = Request.where(["listing_id = ? and approved = ?", params[:id], 1])
    render json: @all_listing_approved_requests
  end

  # POST /requests
  def create
    @request = Request.new(request_params)

    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(approved: params[:request])
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:listing_id, :user_id, :start_date, :end_date, :approved, :message_id)
    end
end
