class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  # sign_upのときに、nameも許可する
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  #account_updateのときに、nameも許可する
    devise_parameter_sanitizer.permit(:account_update, keys:[:name])
  end
end
