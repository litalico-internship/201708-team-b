class Api::UsersController < ApplicationController
  def get_all_users
    users = User.where.not(location: nil)
    users.to_json(only: [:id, :nickname, :latitude, :longitude])
    render json: users, status: :ok
  end
end
