class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!
  before_action :configure_admin_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
    end
  end

  def configure_admin_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |admin_params|
    	admin_params.permit({ roles: [] }, :email, :password, :password_confirmation)
    end
  end
end
