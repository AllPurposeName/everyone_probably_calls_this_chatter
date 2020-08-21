class ChatRoom < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :users, through: :conversations
  has_many :messages

  def other_user(user)
    User
      .includes(:conversations)
      .find_by(conversations: { chat_room_id: id })
  end
end
