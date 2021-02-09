class ApplicationController < ActionController::Base
  # def sign_up_params
  #   params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation)
  # end

  # def account_update_params
  #   params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation, :current_password)
  # end
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fullname username main_image cover_image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fullname username main_image cover_image])
  end
end
