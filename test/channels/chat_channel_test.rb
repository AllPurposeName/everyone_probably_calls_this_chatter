require "test_helper"

class ChatChannelTest < ActionCable::Channel::TestCase
  def test_subscription
    chat_room = ChatRoom.create!
    subscribe chat_room_id: chat_room.id
    assert subscription.confirmed?
    assert_has_stream_for chat_room
  end

  def test_broadcasting
    chat_room = ChatRoom.create!
    assert_broadcasts(chat_room, 1) do
      ChatChannel.broadcast_to(chat_room, message: 'hello')
    end
  end
end
