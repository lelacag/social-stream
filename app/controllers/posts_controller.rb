class PostsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, only: [:like, :report]
  
  def create
    if user_signed_in?
      @post = Post.new(post_params.merge!(user_id: current_user.id))
      @post.save
      redirect_to :root
    else
      redirect_to :new_user_registration, flash: {post_params: post_params}
    end
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
      params.require(:post).permit(:subject, :body, :catch_phrase)
    end
end
