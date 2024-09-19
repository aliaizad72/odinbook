class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    flash[:notice] = "Cannot comment nothing :/" if @comment.invalid?
    @comment.save
    redirect_back_or_to root_path
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :post_id).merge(user_id: current_user.id)
  end
end
