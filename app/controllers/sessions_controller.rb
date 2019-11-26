class SessionsController < ApplicationController

  def new
  end

  def create

    if @user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])

  puts "USER IS"
  pp @user
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      # cookies[:user_id] = @user.id
      # byebug
      session[:user_id] = @user.id
      puts session[:user_id]
      render json: @user
    else
      puts "HUGE ERROR ON LOGIN"
      render json: @user.errors, status: :unprocessable_entity
    # If user's login doesn't work, send them back to the login form or put a message why it didn't work maybe
      # redirect_to "sessions/new"
    end
  end

    
      

  def destroy
    session[:user_id] = nil
    render json: {}
  end

  def me
    puts "SESSION IS"
    puts session[:user_id]  
    if session[:user_id]
      render json: User.find(session[:user_id])
    else
      # render json: false
      render status: 403, json: { error: :unauthorized }
    end
  end


end
