class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #call the configured params
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #protect the database while allowing these fiels to be updated
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username,:email, :password, :password_confirmation, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:login,:username,:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:username,:email, :password, :password_confirmation, :current_password)}
  end

end
