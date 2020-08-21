class NewMessageService
  attr_reader :body, :chat_room, :filters, :user

  def initialize(body:, user:, chat_room:, filters: default_filters)
    @body      = body
    @chat_room = chat_room
    @filters   = filters
    @user      = user
  end

  def self.create!(body:, user:, chat_room:)
    new(body: body, user: user, chat_room: chat_room).create!
  end

  def create!
    Message.create!(body: filtered_body, user_id: user.id, chat_room_id: chat_room.id)
  end

  def filtered_body
    filters.reduce(body) do |bod, filter|
      bod = filter.filter(bod)
      bod
    end
  end

  def default_filters
    [EmojiFilterService]
  end
end

