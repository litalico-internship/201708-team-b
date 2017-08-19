class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @likes = User.where(id: params[:id].to_i).select('score')[0].score
  end
end
