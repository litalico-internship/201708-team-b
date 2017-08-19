class LikesController < ApplicationController
  def add_likes
    like = User.find(params[:user_id].to_i).increment(:score)
    like.save
    @user = User.find(params[:user_id].to_i)
    @likes = User.where(id: params[:user_id].to_i).select('score')[0].score
  end

  def delete_likes
    like = User.find(params[:user_id].to_i).decrement(:score)
    like.save
    @user = User.find(params[:user_id].to_i)
    @likes = User.where(id: params[:user_id].to_i).select('score')[0].score
  end
end
