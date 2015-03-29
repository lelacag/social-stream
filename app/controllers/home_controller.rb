class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:follow_user]

  def index
    @communities = Community.limit(8)
    # redirect_to root_url(subdomain: @current_community.domain)

    if current_user
      @community = Community.new
    end
    # @client_token = Braintree::ClientToken.generate
  end

  def profile
    @user = User.where(username: params['username']).first
  end

  def follow_user
    @follow_user = User.find(params['user_id'])
    begin
      current_user.follow(@follow_user)
      redirect_to :back, notice: 'Now following user'
    rescue
      redirect_to :back, alert: 'Error following user'
    end
  end
end
