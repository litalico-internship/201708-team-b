module Users
  class DirectMessagesController < ApplicationController
    before_action :set_context

    def index
      @message = DirectMessage.new
    end

    def create
      @message = current_user.direct_messages.new(create_params)
      if @message.save
        render json: @message.to_json
      else
        flash.now[:alert] = 'メッセージの送信に失敗しました。'
        render :index
      end
    end

    private

    def create_params
      params.require(:direct_message).permit(:text).merge(receiver_id: params[:user_id])
    end

    def set_context
      @partner = User.find(params[:user_id])
      @messages = DirectMessage
                    .where(sender_id: [current_user.id, @partner.id], receiver_id: [current_user.id, @partner.id])
                    .order(:created_at)
    end
  end
end
