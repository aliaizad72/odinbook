class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.new(post_params)
    flash[:notice] = "Cannot post empty contents :/" if @post.invalid?
    @post.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(user_id: current_user.id)
  end
end
