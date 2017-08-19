class DirectMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "direct_message_#{params[:sender_id]}_#{params[:receiver_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    text = data['message']['text']
    sender_id = data['message']['sender_id']
    receiver_id = data['message']['receiver_id']
    DirectMessage.create(text: text, sender_id: sender_id, receiver_id: receiver_id)
    ActionCable.server.broadcast "direct_message_#{sender_id}_#{receiver_id}}", message: text
  end
end
