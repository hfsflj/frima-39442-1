class ApplicationController < ActionController::Base
  before_action :basic_auth, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :user_name,
      :last_name,
      :first_name,
      :last_name_frigana,
      :first_name_frigana,
      :birthday
    ])
  end


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
#export BASIC_AUTH_USER='xxxx'
#export BASIC_AUTH_PASSWORD='0000'