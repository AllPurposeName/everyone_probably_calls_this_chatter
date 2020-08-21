class MessagesController < ApplicationController
  def create
    chat_room = ChatRoom.find(strong_params[:chat_room_id])
    message   = NewMessageService.create!(
      body:      message_body,
      user:      current_user,
      chat_room: chat_room
    )
    ChatChannel.broadcast_to(
      chat_room,
      message: {
        body: message.body,
        current_user: message.user.name,
        chat_room: chat_room
      }
    )
  end

  private

  def strong_params
    params.permit(:chat_room_id, :current_user_id)
  end

  def message_body
    params.require(:message).permit(:body)[:body]
  end
end
