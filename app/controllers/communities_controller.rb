class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /communities
  # GET /communities.json
  def index
    # @user = User.find(params[:user_id])
    @communities = @user.communities
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
  end

  # GET /communities/new
  def new
    # @user = User.find(params[:user_id])
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    # @community = Community.new(community_params)
    @community = Community.create :name => "Community", :owner_id => @user.id

    respond_to do |format|
      if @community.save
        format.html { redirect_to user_community_url(@community.owner_id, @community), notice: 'Community was successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to user_community_url(@community.owner_id, @community), notice: 'Community was successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to user_communities_url, notice: 'Community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:name)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
