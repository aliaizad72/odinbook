class PagesController < ApplicationController
  def home
    if user_signed_in?
      @posts = Post.all_posts
      @post = Post.new
    else
      redirect_to new_user_session_path
    end
  end
end
