module Users
  class MessagesController < PermissionController
    def index
      @receiver = User.find(params[:user_id])
      @messages = DirectMessage.where(receiver_id: @receiver.id, sender_id: current_user.id)
      @message = DirectMessage.new
    end
  end
end
