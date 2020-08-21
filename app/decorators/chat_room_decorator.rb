class ChatRoomDecorator
  delegate(:messages, :id, to: :chat_room)

  attr_accessor :chat_room, :current_user

  def initialize(chat_room:, current_user:)
    @chat_room    = chat_room
    @current_user = current_user
  end

  def title
    "Chat between #{chat_room.users.pluck(:name).join(' and ')}"
  end

  def current_user_id
    current_user.id
  end

  def messages
    chat_room.messages
  end
end
