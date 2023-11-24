class UsersController < ApplicationController
  skip_before_action :basic_auth, only: [:new, :create]
  def index
    
  end

  def show
    
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_frigana,
      :first_name_frigana,
      :birthday
    ])
  end
end

end
