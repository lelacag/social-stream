class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  # respond_to :json

  after_filter :create_community, only: :create

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
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
        # render js: "window.location.href=' " +  communities_path + " ' "
        render js: "window.location.href=' " +  root_path + " ' "
        # render html: redirect_to communities_path, notice: 'Community was successfully created.'
      end
    else
      clean_up_passwords resource
      # set_minimum_password_length
      # respond_with resource
      render json: resource.errors, status: :unprocessable_entity
      logger.error(resource.errors.full_messages.join("\n"))
    end
  end

  private

  def create_community
    if params[:phrase].present?
      @community = Community.create name: params[:phrase], owner_id: resource.id, image: params[:image], subdomain: params[:phrase]
    end
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
