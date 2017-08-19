class PermissionController < ApplicationController
  before_action :authenticate_user!

  class NotPermissionError < StandardError; end

  def confirm_user(resource)
    if resource.class.name == 'User'
      raise NotPermissionError, "You can't do it" if current_user != resource
    else
      raise NotPermissionError, "You can't do it" if current_user != resource.user
    end
  end
end
