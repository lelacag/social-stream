class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  # before_filter :set_current_domain

  def after_sign_in_path_for(_resource)
    root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :username, :password_confirmation, :phrase) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :facebook_link, :twitter_link, :vine_link, :avatar, :username) }
  end

  def set_current_domain
    @current_community = Community.find_by_domain!(request.subdomains.first)
    # @current_domain = Community.find_by_domain!(request.host)
  end
end
