class ApplicationController < ActionController::API
  include ActionController::Cookies
  # before_action :set_csrf_cookie

  # include ActionController::Cookies
  # include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :exception

  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception,  unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token

  # private

  # def set_csrf_cookie
  #   cookies["CSRF-TOKEN"] = form_authenticity_token
  # end
end
