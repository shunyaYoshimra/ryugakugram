class CommentsController < ApplicationController

  def create
    comment = current_user.comments.new(comment_params)
    comment.post_id = params[:post_id]
    comment.save
    redirect_to comment.post
  end

  def destroy
    comment = Comment.find_by(user_id: current_user.id, post_id: params[:id])
    comment.destroy
    redirect_to comment.post
  end

  private
  
  def comment_params
    params.permit(:content)
  end
end
