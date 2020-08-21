class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = current_user.chat_rooms
  end

  def show
    @chat_room = ChatRoomDecorator.new(
      chat_room:    ChatRoom.find(chat_room_id),
      current_user: current_user
    )
  end

  private

  def chat_room_id
    params.permit(:id)[:id]
  end
end
