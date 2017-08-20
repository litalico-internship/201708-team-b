class AutoMatchesController < PermissionController
  def show
    @user = current_user
    @target_user = User.order("likes_count desc").limit(1).where.not(id: current_user.id)[0]
  end
end
