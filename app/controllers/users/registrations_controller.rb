class Users::RegistrationsController < Devise::RegistrationsController
  # respond_to :json

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        # respond_with resource, location: after_sign_up_path_for(resource)
        @community = Community.create :name => params[:set_phrase], :owner_id => resource.id
        render js: "window.location.href=' " + user_dashboards_path(current_user) + " ' "
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      # set_minimum_password_length
      # respond_with resource
      render json: resource.errors, status: :unprocessable_entity
      logger.error(@user.errors.full_messages.join("\n"))
    end
  end
end
