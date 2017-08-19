class MessagesController < ApplicationController
  def index
    @receiver = User.find(params[:user_id])
    @messages = Messages.where(receiver_id: @receiver.id, sender_id: current_user.id)
    @message = Message.new
  end
end
