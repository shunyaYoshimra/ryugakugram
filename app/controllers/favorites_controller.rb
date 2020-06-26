class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(user_id: current_user.id, comment_id: params[:comment_id])
    favorite.save
    redirect_to favorite.comment.post
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, comment_id: params[:id])
    favorite.destroy
    redirect_to favorite.comment.post
  end
end
