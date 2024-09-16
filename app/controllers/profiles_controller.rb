class ProfilesController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @post = Post.new
    @posts = Post.user_posts(@user.id)
  end
end
