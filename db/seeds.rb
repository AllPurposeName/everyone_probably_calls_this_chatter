nora    = User.create!(name: "Nora")
patrick = User.create!(name: "Patrick")
chat = ChatRoom.create!
convo = Conversation.create(user: nora, chat_room: chat)
convo = Conversation.create(user: patrick, chat_room: chat)
