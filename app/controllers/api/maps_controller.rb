class Api::MapsController < ApplicationController
  def get_location
    @user = current_user
    location = @user.present? ? Geocoder.coordinates(user.location) : Geocoder.coordinates("Tokyo, Japan")
    render json: location, status: :ok
  end
end
