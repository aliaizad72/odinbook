class PagesController < ApplicationController
  def home
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
      @posts = @user.posts
    else
      redirect_to new_user_session_path
    end
  end
end
