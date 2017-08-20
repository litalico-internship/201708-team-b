class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # auto_matchが完成したら
    # auto_match_path
    # top_index_path
    '/auto_matches/show'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :age, :location, :sexuality, :name, :icon_image, :description]) 
  end

end
