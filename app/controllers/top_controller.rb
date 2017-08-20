class TopController < PermissionController
  def index
    @recommended_user = User.get_recommended_users(current_user)
  end
end
