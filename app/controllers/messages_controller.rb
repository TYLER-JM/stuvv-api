class MessagesController < ApplicationController
  before_action :set_message, only: [ :update, :destroy]

  # GET /messages
  def index
    @messages = Message.all

    render json: @messages
  end

  # GET /messages/1
  # now returning the message object relating to the to_user_id
  def show
    @convo = Message.where(to_user_id: params[:id])
    # @convo = @message.conversation
    render json: @convo
    # render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    # @message = Message.new(params[:message])
    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    pp params[:message]
    # @message = Message.find(params[:id])
    if @message.update(conversation: params[:message])
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      # params.permit(:conversation, :read)
      params.require(:message).permit(:conversation, :read, :to_user_id, :from_user_id)
    end
end
