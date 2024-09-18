class LikesController < ApplicationController
  def like
    @post = Post.find_by(id: params[:id])
    @post.liked_users << current_user
    redirect_back_or_to root_path
  end
end
