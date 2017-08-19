class DirectMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "direct_message_#{params[:sender_id]}_#{params[:receiver_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    DirectMessage.create(text: data['message']['text'], sender_id: data['message']['sender_id'], receiver_id: data['message']['receiver_id'])
    ActionCable.server.broadcast "direct_message_#{params[:sender_id]}_#{params[:receiver_id]}", message: data['message']
  end
end
