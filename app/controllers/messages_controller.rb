class MessagesController < ApplicationController
  before_action :chat_room

  def new
    @message = Message.new
  end

  def create
    message = Message.new(
      permitted_params.merge(
        user_id: current_user.id,
        chat_room_id: @chat_room.id
      )
    )
    message.save!
    MessageBroadcastJob.perform_later
    head :ok
  end

  def dynamic_call
    render partial: 'messages', locals: {
      messages: @chat_room.messages
    }
  end

  private

  def chat_room
    @chat_room = ChatRoom.find_by(id: params[:chat_room_id])
  end

  def permitted_params
    params.require(:message).permit(:body)
  end
end
