class FollowsController < ApplicationController
  def add_following
    @user = User.find_by(id: params[:id])
    current_user.followings << @user
    redirect_back_or_to root_path
  end

  def delete_following
    @user = User.find_by(id: params[:id])
    @follow = Follow.find_by(follower_id: current_user.id, following_id: @user.id)
    @follow.destroy
    redirect_back_or_to root_path
  end
end
