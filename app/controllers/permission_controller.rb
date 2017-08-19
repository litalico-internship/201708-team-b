class PermissionController < ApplicationController
  before_action :authenticate_user!

  class NotPermissionError < StandardError; end

  rescue_from NotPermissionError do
    redirect_to root_path, alert: "You can't do it"
  end

  def confirm_user(resource)
    if resource.class.name == 'User'
      raise NotPermissionError if current_user != resource
    else
      raise NotPermissionError if current_user != resource.user
    end
  end
end
