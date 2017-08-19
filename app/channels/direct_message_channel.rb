class DirectMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "direct_message_#{current_user.id}_#{params[:receiver_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create(text: data['message'], sender_id: current_user.id, receiver_id: params[:receiver_id])
    ActionCable.server.broadcast "direct_message_#{current_user.id}_#{params[:receiver_id]}", message: data['message']
  end
end
