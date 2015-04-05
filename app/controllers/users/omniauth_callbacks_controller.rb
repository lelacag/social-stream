class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate_user!

  def all
    p env["omniauth.auth"]
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user.persisted?
      set_flash_message(:notice, :success, :kind => user.provider) if is_navigational_format?
      sign_in user, :event => :authentication #this will throw if user is not activated
      render 'shared/close_popup'
    else
      flash[:error] = "There was a problem with logging in. Please try again."
      render :text => "There was a problem with logging in. Please try again."
    end
  end

  alias_method :facebook, :all
  alias_method :twitter, :all
  alias_method :google_oauth2, :all
end
