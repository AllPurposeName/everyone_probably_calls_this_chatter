class User < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :chat_rooms, through: :conversations
  has_many :messages, through: :chat_rooms
end
