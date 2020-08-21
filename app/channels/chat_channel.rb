class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for ChatRoom.find(params[:chat_room_id])
  end

  def unsubscribed
  end
end
