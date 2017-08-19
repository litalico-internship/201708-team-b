class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, target_id: params[:user_id])
    @likes = Like.where(target_id: params[:user_id])
    redirect_to request.referrer
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, target_id: params[:id])
    like.destroy
    @likes = Like.where(target_id: params[:user_id])
    redirect_to request.referrer
  end
end
