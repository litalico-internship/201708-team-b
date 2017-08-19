class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @likes = Like.where(target_id: params[:id])
    @likes_count = Like.where(target_id: params[:id]).count
  end
end
