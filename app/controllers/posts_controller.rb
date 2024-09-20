class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @post.comments.reverse
  end
  def create
    @post = Post.new(post_params)
    flash[:notice] = "Cannot post empty contents :/" if @post.invalid?
    @post.save
    redirect_back_or_to root_path
  end

  def liked_by
    @post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(user_id: current_user.id)
  end
end
