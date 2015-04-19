class PostsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, only: [:like, :report]
  before_action :set_post, only: [:show, :liked_by, :report, :destroy, :ignore]
  after_filter :send_post_to_community, only: :create

  def create
    @community = Community.find(params[:community_id])
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to show_community_url, notice: 'Phrase was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    # @community = Community.find(params[:community_id])
    @community = Community.find_by_subdomain!(request.subdomain)
  end

  def liked_by
    respond_to do |format|
      @post.liked_by current_user
      # format.html { redirect_to :back, notice: "you liked" }
      format.js
      format.json
    end
  end

  def report
    respond_to do |format|
      @post.update_attribute(:report, true)
      format.js
      format.json
    end
  end

  def ignore
    respond_to do |format|
      @post.update_attribute(:report, false)
      format.js
      format.json
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  def reports
    @community = Community.find_by_subdomain!(request.subdomain)
    if @community.owner_id == current_user.id
      @posts = @community.posts.where(report: true)
    else
      redirect_to root_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:subject, :body)
  end

  def send_post_to_community
    current_user.send_post_to_community(post: @post, to_community: @community)
  end
end
