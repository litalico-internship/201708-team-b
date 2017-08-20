class Api::UsersController < ApplicationController
  def get_all_users
    users = current_user.present? ? User.where.not("id = ? AND location = ?", current_user.id, nil) : User.where.not(location: nil)
    users.to_json(only: [:id, :nickname, :latitude, :longitude])
    render json: users, status: :ok
  end
end
