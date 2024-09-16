class PagesController < ApplicationController
  def home
    if user_signed_in?
      @posts = (current_user.followings.map(&:posts).flatten + current_user.posts).sort_by(&:created_at).reverse!
      @post = Post.new
      @users = User.where.not(id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end
end
