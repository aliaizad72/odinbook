class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by(id: params[:id])
    @post = Post.new
    @posts = Post.user_posts(@user.id)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def followings
    @followings = User.find_by(id: params[:id]).followings
  end
end
