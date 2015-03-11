class PostsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, only: [:like, :report]
  after_filter :send_post_to_community, only: :create

  def create
    @community = Community.find(params[:community_id])
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to community_url(@community), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @community = Community.find(params[:community_id])
    @post = Post.find(params[:id])
  end

  def like
    post = Post.find(params['post_id'])
    current_user.favorite(post)
    redirect_to :root
  end

  def report
    post_report = PostReport.create(user_id: current_user.id, post_id: params['post_id'])
    redirect_to :root, notice: 'Post reported'
  end

  private

  def post_params
    params.require(:post).permit(:subject, :body)
  end

  def send_post_to_community
    current_user.send_post_to_community(post: @post, to_community: @community)
  end
end
