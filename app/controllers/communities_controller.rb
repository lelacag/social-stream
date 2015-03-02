class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :join]
  before_action :set_community, only: [:show, :edit, :update, :destroy, :join]
  # before_action :set_user, except: [:index, :join]

  # GET /communities
  # GET /communities.json
  def index
    # @user = User.find(params[:user_id])
    # @communities = @user.communities
    @communities = Community.all
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
    @community = Community.create :name => params[:community][:name], :owner_id => current_user.id, :image => params[:community][:image]

    respond_to do |format|
      if @community.save
        format.html { redirect_to community_url(@community), notice: 'Community was successfully created.' }
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
        format.html { redirect_to community_url(@community), notice: 'Community was successfully updated.' }
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
      format.html { redirect_to communities_url, notice: 'Community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    begin
      current_user.join(@community)
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You joined.' }
        # format.js { render js: "window.location.href=' " + communities_path + " ' " }
      end
    rescue
      redirect_to :back, alert: 'you are already in this community'
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

    # def set_user
    #   @user = User.find(params[:user_id])
    # end
end
