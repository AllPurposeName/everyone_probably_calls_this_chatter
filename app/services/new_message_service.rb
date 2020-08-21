class NewMessageService
  attr_reader :body, :chat_room, :user

  def initialize(body:, user:, chat_room:)
    @body      = body
    @chat_room = chat_room
    @user      = user
  end

  def self.create!(body:, user:, chat_room:)
    new(body: body, user: user, chat_room: chat_room).create!
  end

  def create!
    Message.create!(body: body, user_id: user.id, chat_room_id: chat_room.id)
  end
end

