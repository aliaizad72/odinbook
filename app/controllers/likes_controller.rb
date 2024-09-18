class LikesController < ApplicationController
  def like
    @post = Post.find_by(id: params[:id])
    @post.liked_users << current_user
    redirect_back_or_to root_path
  end

  def unlike
    @post = Post.find_by(id: params[:id])
    @like = Like.find_by(post_id: @post.id, user_id: current_user.id)
    @like.destroy
    redirect_back_or_to root_path
  end
end
