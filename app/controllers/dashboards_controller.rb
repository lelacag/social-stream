class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @communities = @user.communities
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
