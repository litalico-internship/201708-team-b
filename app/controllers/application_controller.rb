class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  def after_sign_in_path_for(resource)
    auto_match_path
  end
end
